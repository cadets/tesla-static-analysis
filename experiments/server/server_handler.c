#include <pthread.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "protocol_impl.h"
#include "server_lock.h"

pthread_mutex_t lock;

struct server_state {
  int fd;
  bool active;
  uint16_t next;

  uint8_t *data_buf;
  size_t data_buf_len;
};

struct server_state *init_state(int fd) {
  struct server_state *state = malloc(sizeof(*state));
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

  FILE *log = fopen("server.log", "a");
  if(log) {
    fprintf(log, "%d:", fd);
    fwrite(state->data_buf, 1, state->data_buf_len, log);
    fprintf(log, ":\n");
  }
  fclose(log);

  pthread_mutex_unlock(&lock);

  free(state->data_buf);
  free(state);
}

void handle_request(uint16_t n, void *state) {
  struct server_state *sst = (struct server_state *)state;

  printf("Received request to send %d packets\n", n);

  sst->data_buf_len = n*5;
  sst->data_buf = malloc(sizeof(uint8_t) * sst->data_buf_len);

  struct packet permit = {
    .kind = PK_PERMIT,
    .seq_no = n,
    .data = { 0 }
  };
  send_packet(sst->fd, permit);
}

void handle_permit(uint16_t n, void *state) {
  struct server_state *sst = (struct server_state *)state;
  sst->active = false;
}

void handle_data(uint8_t *data, uint16_t sn, void *state) {
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
  struct server_state *sst = (struct server_state *)state;
  sst->active = false;
}

void handle_done(void *state) {
  struct server_state *sst = (struct server_state *)state;
  sst->active = false;
}
