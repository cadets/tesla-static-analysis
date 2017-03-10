#include <assert.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "protocol_impl.h"
#include "server_lock.h"

#ifdef TESLA
#include "tesla-macros.h"

#define HANDLER() \
  TESLA_WITHIN(write_to_fd, TSEQUENCE( \
    call(handle_connection), \
    TESLA_ASSERTION_SITE, \
    returnfrom(handle_connection) \
  ))

#define REPEATED_HANDLER() \
  TESLA_WITHIN(write_to_fd, TSEQUENCE( \
    call(handle_connection), \
    REPEAT(1, ANY_REP, TESLA_ASSERTION_SITE), \
    returnfrom(handle_connection) \
  ))
#endif

pthread_mutex_t lock;
void handle_connection(int fd);
void *write_to_fd(void *data);

struct server_state {
  int fd;
  bool active;
  uint16_t next;

  uint8_t *data_buf;
  size_t data_buf_len;
};

struct server_state *init_state(int fd) {
  struct server_state *state = calloc(1, sizeof(*state));
  state->fd = fd;
  state->active = true;
  state->next = 0;
  return state;
}

void handle_connection(int fd) {
  printf("Starting connection [%d]\n", fd);
  struct server_state *state = init_state(fd);

  while(state->active) {
    handle_packet(next_packet(fd), state);
  }

  pthread_mutex_lock(&lock);

  for(size_t i = 0; i < state->data_buf_len; i++) {
    FILE *log = fopen("server.log", "a");
    if(log) {
      fwrite(state->data_buf+i, 1, 1, log);
      fclose(log);
    }
  }

  pthread_mutex_unlock(&lock);

  free(state->data_buf);
  free(state);

  printf("Wrote data to log\n");
}

void handle_request(uint16_t n, void *state) {
  HANDLER();

  struct server_state *sst = (struct server_state *)state;

  printf("Received request to send %d packets\n", n);

  sst->data_buf_len = n*5;
  sst->data_buf = calloc(sst->data_buf_len, sizeof(uint8_t));

  struct packet permit = {
    .kind = PK_PERMIT,
    .seq_no = n,
    .data = { 0 }
  };
  send_packet(sst->fd, permit);
}

void handle_permit(uint16_t n, void *state) {
  HANDLER();

  struct server_state *sst = (struct server_state *)state;
  sst->active = false;
}

void handle_data(uint8_t *data, uint16_t sn, void *state) {
  REPEATED_HANDLER();

  struct server_state *sst = (struct server_state *)state;

  if(sn != sst->next) {
    struct packet done = {
      .kind = PK_DONE,
      .seq_no = 0,
      .data = { 0 }
    };
    send_packet(sst->fd, done);
    sst->active = false;
    return;
  }

  for(int i = 0; i < 5; i++) {
    sst->data_buf[(sn*5) + i] = data[i];
  }

  struct packet ack = {
    .kind = PK_ACK,
    .seq_no = sst->next++,
    .data = { 0 }
  };
  send_packet(sst->fd, ack);
}

void handle_ack(uint16_t sn, void *state) {
  HANDLER();

  struct server_state *sst = (struct server_state *)state;
  sst->active = false;
}

void handle_done(void *state) {
  HANDLER();

  struct server_state *sst = (struct server_state *)state;
  sst->active = false;
}
