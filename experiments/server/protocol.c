#include <assert.h>
#include <stdio.h>

#include "protocol.h"

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
