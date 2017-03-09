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

int send_packet(int fd, struct packet p);
struct packet next_packet(int fd);

uint16_t packets_for_bytes(uint16_t n_bytes);

char *packet_kind_name(enum packet_kind k);
char *packet_string(struct packet p);

void handle_packet(struct packet p, void *state);

#endif
