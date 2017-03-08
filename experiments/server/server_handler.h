#ifndef SERVER_HANDLER_H
#define SERVER_HANDLER_H

#include <stdio.h>

#include "protocol.h"

void handle_connection(int fd);

struct packet next_packet(int fd);

#endif
