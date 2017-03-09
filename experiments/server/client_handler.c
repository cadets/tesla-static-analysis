#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "protocol_impl.h"

struct client_state {
  int fd;
  bool active; 
};

struct client_state *init_state(int fd) {
  struct client_state *state = malloc(sizeof(*state));
  state->fd = fd;
  state->active = true;
  return state;
}

void handle_connection(int fd) {
  struct client_state *state = init_state(fd);

  int bytes = 76;

  struct packet req = {
    .kind = PK_REQUEST,
    .seq_no = packets_for_bytes(bytes),
    .data = { 0 }
  };

  send_packet(fd, req);

  while(state->active) {
    handle_packet(next_packet(fd), state);
  }
}

void handle_request(uint16_t n, void *state) {
}

void handle_permit(uint16_t n, void *state) {
}

void handle_data(uint8_t *data, uint16_t sn, void *state) {
}

void handle_ack(uint16_t sn, void *state) {
}

void handle_done(void *state) {
}
