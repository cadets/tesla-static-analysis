#ifndef CLIENT_HANDLER_H
#define CLIENT_HANDLER_H

#include "protocol_impl.h"

typedef struct client_state {
  int socket;
  size_t n_packets;
} state;

void expect_permit(state *st);
void expect_ack(state *st);
void expect_done(state *st);
void error(state *st, char *message);

struct packet data_packet(state *st, uint16_t sn);
struct packet done_packet(void);
void get_data(state *st, uint16_t sn, uint8_t *buf);

#endif
