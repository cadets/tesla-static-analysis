#include <unistd.h>

#include "server_handler.h"

void handle_connection(int fd) {
  printf("Starting connection [%d]\n", fd);
  struct packet req = next_packet(fd);
  
  printf("%s\n", packet_string(req));
}

struct packet next_packet(int fd) {
  uint8_t buf[8];
  
  int n_read = 0;
  int to_read = 8;

  while(n_read < to_read) {
    int n = read(fd, buf, to_read - n_read);
    n_read += n;
  }

  return from_buf(buf);
}
