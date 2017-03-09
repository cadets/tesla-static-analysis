#include <stdio.h>

#include "server_handler.h"

void handle_connection(int fd) {
  printf("Starting connection [%d]\n", fd);

  uint16_t n_packets = get_request(fd);

  if(n_packets > 0) {
    permit(fd, n_packets);
  } else {
    done(fd);
    return;
  }
}

uint16_t get_request(int fd) {
  struct packet req = next_packet(fd);

  if(req.kind != PK_REQUEST) {
    return 0;
  }

  return req.seq_no;
}

void permit(int fd, uint16_t n) {
  struct packet permit = {
    .kind = PK_PERMIT,
    .seq_no = n,
    .data = { 0 }
  };
  send_packet(fd, permit);
}

void done(int fd) {
  struct packet done = {
    .kind = PK_DONE,
    .seq_no = 0,
    .data = { 0 }
  };
  send_packet(fd, done);
}
