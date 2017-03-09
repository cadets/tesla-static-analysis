#ifndef CLIENT_HANDLER_H
#define CLIENT_HANDLER_H

#include "protocol.h"

void handle_connection(int fd);

uint16_t packets_for_bytes(uint16_t bytes);

void request(int fd, uint16_t n_bytes);

int permission(int fd, uint16_t req);

void get_packet_data(uint16_t packet_i, uint8_t *buf);

void data(int fd, uint16_t packet_i);

#endif
