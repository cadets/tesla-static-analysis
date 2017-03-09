#ifndef PROTOCOL_IMPL_H
#define PROTOCOL_IMPL_H

#include "protocol.h"

void handle_connection(int fd);

void handle_request(uint16_t n, void *state);
void handle_permit(uint16_t n, void *state);
void handle_data(uint8_t *data, uint16_t sn, void *state);
void handle_ack(uint16_t sn, void *state);
void handle_done(void *state);

#endif
