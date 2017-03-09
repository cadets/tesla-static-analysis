#include "client_handler.h"

void handle_connection(int fd) {
  struct packet p = {
    .kind = PK_REQUEST,
    .seq_no = 300,
    .data = { 0, 0, 0, 0, 0 }
  };

  send_packet(fd, p);
}
