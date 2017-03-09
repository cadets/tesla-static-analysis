#include <errno.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/select.h>
#include <unistd.h>

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

struct packet next_packet(int fd) {
  uint8_t buf[8];

  fd_set readset;
  int result;
  do {
    FD_ZERO(&readset);
    FD_SET(fd, &readset);
    result = select(fd + 1, &readset, NULL, NULL, NULL);
  } while(result == -1 && errno == EINTR);

  if(result > 0) {
    if(FD_ISSET(fd, &readset)) {
      int to_read = 8;
      int n_read = 0;

      while(n_read < to_read) {
        int n = read(fd, buf + n_read, to_read - n_read);
        n_read += n;
      }
    }
  } else if(result < 0) {
    printf("Error on select(): %s", strerror(errno));
  }

  return from_buf(buf);
}
