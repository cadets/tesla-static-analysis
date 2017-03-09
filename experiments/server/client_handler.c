#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "protocol_impl.h"

void get_data(uint16_t i, uint8_t *buf);
void finish(void *);

struct client_state {
  int fd;
  bool active; 
  uint16_t max_sn;
  uint16_t next;
};

struct client_state *init_state(int fd, uint16_t bytes) {
  struct client_state *state = malloc(sizeof(*state));
  state->fd = fd;
  state->active = true;
  state->max_sn = packets_for_bytes(bytes);
  state->next = 0;
  return state;
}

void handle_connection(int fd) {
  struct client_state *state = init_state(fd, 56);

  struct packet req = {
    .kind = PK_REQUEST,
    .seq_no = state->max_sn,
    .data = { 0 }
  };

  send_packet(fd, req);

  while(state->active) {
    handle_packet(next_packet(fd), state);
  }
}

void handle_request(uint16_t n, void *state) {
  struct client_state *cst = (struct client_state *)state;
  cst->active = false;
}

void handle_permit(uint16_t n, void *state) {
  struct client_state *cst = (struct client_state *)state;

  printf("Received permission for %d packets\n", n);

  uint8_t buf[5];
  get_data(cst->next, buf);

  struct packet first = {
    .kind = PK_DATA,
    .seq_no = cst->next,
    .data = { buf[0], buf[1], buf[2], buf[3], buf[4] }
  };
  send_packet(cst->fd, first);
}

void handle_data(uint8_t *data, uint16_t sn, void *state) {
  finish(state);
}

void handle_ack(uint16_t sn, void *state) {
  struct client_state *cst = (struct client_state *)state;

  if(sn != cst->next) {
    printf("Incorrect acknowledgement (got: %d, wanted: %d)\n", sn, cst->next);
    return;
  }

  printf("Acknowledged data packet %d\n", sn);

  cst->next++;
  
  if(cst->next == cst->max_sn) {
    finish(state);
    return;
  }

  uint8_t buf[5];
  get_data(cst->next, buf);

  struct packet next = {
    .kind = PK_DATA,
    .seq_no = cst->next,
    .data = { buf[0], buf[1], buf[2], buf[3], buf[4] }
  };
  send_packet(cst->fd, next);
}

void handle_done(void *state) {
  finish(state);
}

void get_data(uint16_t i, uint8_t *buf) {
  for(int i = 0; i < 5; i++) {
    buf[i] = 0;
  }
}

void finish(void *state) {
  struct client_state *cst = (struct client_state *)state;
  struct packet done = {
    .kind = PK_DONE,
    .seq_no = 0,
    .data = { 0 }
  };
  send_packet(cst->fd, done);
  cst->active = false;
}
