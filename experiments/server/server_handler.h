#ifndef SERVER_HANDLER_H
#define SERVER_HANDLER_H

#include "protocol_impl.h"

typedef struct state_st {
  int socket;
  size_t n_packets;
} state;

void expect_request(state *st);
void expect_data(state *st);
void expect_done(state *st);
void success(state *st);
void error(state *st, char *message);

#endif
