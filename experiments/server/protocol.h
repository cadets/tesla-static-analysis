#ifndef PROTOCOL_H
#define PROTOCOL_H

#include <stdint.h>

enum packet_kind {
  PK_REQUEST = 1,
  PK_PERMIT,
  PK_DATA,
  PK_ACK,
  PK_DONE
};

struct packet {
  enum packet_kind kind; 
  uint16_t seq_no;
  uint8_t data[5];
};

struct packet from_buf(uint8_t *buf);
void to_buf(struct packet p, uint8_t *buf);

char *packet_kind_name(enum packet_kind k);
char *packet_string(struct packet p);

#endif
