#include <stdio.h>
#include <stdlib.h>

#include "client_handler.h"

void handle_connection(int fd) {
  request(fd, 256);

  int allowed = permission(fd, 256);

  if(allowed < 0) {
    fprintf(stderr, "Couldn't send data\n");
    return;
  }

  for(uint16_t i = 0; i < allowed; i++) {
    printf("%d\n", i);
    data(fd, i);

    if(receive_ack(fd, i) < 0) {
      return;
    }
  }
}

uint16_t packets_for_bytes(uint16_t n_bytes) {
  uint16_t n_whole = n_bytes / 5;
  uint16_t partial = (n_bytes % 5 == 0 ? 0 : 1);
  return n_whole + partial;
}

void request(int fd, uint16_t n_bytes) {

  struct packet p = {
    .kind = PK_REQUEST,
    .seq_no = packets_for_bytes(n_bytes),
    .data = { 0, 0, 0, 0, 0 }
  };

  send_packet(fd, p);
}

int permission(int fd, uint16_t req) {
  struct packet response = next_packet(fd);
  
  if(response.kind == PK_PERMIT) {
    if(response.seq_no == packets_for_bytes(req)) {
      return (int)packets_for_bytes(req);
    } else {
      fprintf(stderr, "Permission recieved for the wrong number of packets\n");
    }
  } else if(response.kind == PK_DONE) {
    fprintf(stderr, "Permission to send packets denied\n");
  } else {
    fprintf(stderr, "Invalid response to send request\n");
  }

  return -1;
}

void get_packet_data(uint16_t packet_i, uint8_t *buf) {
  for(int i = 0; i < 5; i++) {
    buf[i] = (packet_i * 5) + i;
  }
}

void data(int fd, uint16_t packet_i) {
  uint8_t buf[5];
  get_packet_data(packet_i, buf);

  struct packet data = {
    .kind = PK_DATA,
    .seq_no = packet_i,
    .data = { buf[0], buf[1], buf[2], buf[3], buf[4] }
  };

  send_packet(fd, data);
}

int receive_ack(int fd, uint16_t packet_i) {
  struct packet ack = next_packet(fd);

  if(ack.kind != PK_ACK) {
    return -1;
  }

  if(ack.seq_no != packet_i) {
    return -1;
  }

  return (int)ack.seq_no;
}
