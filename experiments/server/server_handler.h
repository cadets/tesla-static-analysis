#ifndef SERVER_HANDLER_H
#define SERVER_HANDLER_H

#include "protocol_impl.h"

typedef struct state_st {
  int socket;
  uint16_t n_packets;
} state;

struct packet permit_packet(uint16_t n);

void expect_request(state *st);
void expect_data(state *st);
void expect_done(state *st);
void success(state *st);
void error(state *st, char *message);

#endif
