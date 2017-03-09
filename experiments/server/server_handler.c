#include <errno.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/select.h>
#include <unistd.h>

#include "server_handler.h"

#define MIN(x,y) (((x)<(y)) ? (x) : (y))

void handle_connection(int fd) {
  printf("Starting connection [%d]\n", fd);
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
