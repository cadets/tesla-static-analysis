#ifndef SERVER_HANDLER_H
#define SERVER_HANDLER_H

#include <stdio.h>

#include "protocol.h"

void handle_connection(int fd);

uint16_t get_request(int fd);

void permit(int fd, uint16_t n);
void done(int fd);

int get_data(int fd, uint8_t *buf);
void ack(int fd, uint16_t expected);

#endif
