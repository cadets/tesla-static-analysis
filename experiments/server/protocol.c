#include <assert.h>
#include <errno.h>
#include <stdio.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/select.h>
#include <unistd.h>

#include "protocol.h"
#include "protocol_impl.h"

struct packet from_buf(uint8_t *buf) {
  struct packet p;

  assert(buf[0] >= PK_REQUEST && buf[0] <= PK_DONE && "Invalid type");
  p.kind = buf[0];

  p.seq_no = (buf[2] | (buf[1] << 8));
  
  for(int i = 0; i < 5; i++) {
    p.data[i] = buf[i + 3];
  }

  return p;
}

void to_buf(struct packet p, uint8_t *buf) {
  buf[0] = p.kind;

  buf[1] = p.seq_no >> 8;
  buf[2] = p.seq_no & 0xff;

  for(int i = 0; i < 5; i++) {
    buf[i + 3] = p.data[i];
  }
}

int send_packet(int fd, struct packet p) {
  uint8_t buf[8];
  to_buf(p, buf);
  int w = write(fd, buf, 8);

  if(w != 8) {
    fprintf(stderr, "Couldn't send whole packet (%d / %d bytes)\n", w, 8);
  }

  return w;
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

void handle_packet(struct packet p, void *state) {
  switch(p.kind) {
    case PK_REQUEST:
      handle_request(p.seq_no, state);
      break;
    case PK_PERMIT:
      handle_permit(p.seq_no, state);
      break;
    case PK_DATA:
      handle_data(p.data, p.seq_no, state);
      break;
    case PK_ACK:
      handle_ack(p.seq_no, state);
      break;
    case PK_DONE:
      handle_done(state);
      break;
  }
}

uint16_t packets_for_bytes(uint16_t n_bytes) {
  uint16_t n_whole = n_bytes / 5;
  uint16_t partial = (n_bytes % 5 == 0 ? 0 : 1);
  return n_whole + partial;
}

char *packet_kind_name(enum packet_kind k) {
  static char *names[5] = {
    "REQUEST",
    "PERMIT",
    "DATA",
    "ACK",
    "DONE"
  };

  return names[k - 1];
}

char *packet_string(struct packet p) {
  char *ret;
  asprintf(&ret, 
           "%s[%d] {%d, %d, %d, %d, %d}",
           packet_kind_name(p.kind), p.seq_no,
           p.data[0], p.data[1], p.data[2], p.data[3], p.data[4]);
  return ret;
}
