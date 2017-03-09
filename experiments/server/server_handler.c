#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "protocol_impl.h"

struct server_state {
  int fd;
  bool active;
};

struct server_state *init_state(int fd) {
  struct server_state *state = malloc(sizeof(*state));
  state->fd = fd;
  state->active = true;
  return state;
}

void handle_connection(int fd) {
  printf("Starting connection [%d]\n", fd);
  struct server_state *state = init_state(fd);

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
