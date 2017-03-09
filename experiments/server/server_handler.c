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

  for(uint16_t i = 0; i < n_packets; i++) {
    uint8_t buf[5];
    int sn = get_data(fd, buf);

    if(sn != (int)i) {
      done(fd);
      return;
    }

    ack(fd, sn);
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

int get_data(int fd, uint8_t *buf) {
  struct packet data = next_packet(fd);

  if(data.kind != PK_DATA) {
    return -1;
  }

  for(int i = 0; i < 5; i++) {
    buf[i] = data.data[i];
  }

  return data.seq_no;
}

void ack(int fd, uint16_t seq_no) {
  struct packet ack = {
    .kind = PK_ACK,
    .seq_no = seq_no,
    .data = { 0 }
  };
  send_packet(fd, ack);
}
