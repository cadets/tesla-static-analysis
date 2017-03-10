#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "protocol_impl.h"

void handle_connection(int fd) {
  struct packet p = {
    .kind = PK_REQUEST,
    .seq_no = 2039,
    .data = { 0 }
  };

  send_packet(fd, p);
}
