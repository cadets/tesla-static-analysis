#include <stdio.h>

#include "server_handler.h"

void handle_connection(int fd) {
  printf("Starting connection [%d]\n", fd);

  uint16_t n_packets = get_request(fd);
  printf("%d\n", n_packets);
}

uint16_t get_request(int fd) {
  struct packet req = next_packet(fd);

  if(req.kind != PK_REQUEST) {
    return 0;
  }

  return req.seq_no;
}
