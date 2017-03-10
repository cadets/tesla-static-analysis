#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "client_handler.h"

void handle_connection(int fd) {
  state *st = calloc(1, sizeof(*st));
  st->socket = fd;
  st->n_packets = 8192;

  struct packet p = {
    .kind = PK_REQUEST,
    .seq_no = st->n_packets,
    .data = { 0 }
  };
  send_packet(fd, p);

  expect_permit(st);
}

void expect_permit(state *st) {
  struct packet p = next_packet(st->socket);

  if(p.kind == PK_PERMIT) {
    if(p.seq_no != st->n_packets) {
      error(st, "Permission for wrong number of packets");
    }

    send_packet(st->socket, data_packet(st, 0));

    expect_ack(st);
  } else {
    error(st, "Not a permit packet");
  }
}

void expect_ack(state *st) {
  for(uint16_t i = 1; i <= st->n_packets; i++) {
    struct packet p = next_packet(st->socket);

    if(p.kind == PK_ACK) {
      if(p.seq_no != (i-1)) {
        error(st, "Out of sequence ACK");
      }

      if(i < st->n_packets) {
        send_packet(st->socket, data_packet(st, i));
      }
    }
  }

  send_packet(st->socket, done_packet());

  expect_done(st);
}

void expect_done(state *st) {
  struct packet p = next_packet(st->socket);

  if(p.kind != PK_DONE) {
    printf("%s\n", packet_string(p));
    error(st, "Not a done packet");
  }
}

struct packet data_packet(state *st, uint16_t sn) {
  struct packet dp = {
    .kind = PK_DATA,
    .seq_no = sn,
    .data = { 0 }
  };
  get_data(st, sn, dp.data);

  return dp;
}

struct packet done_packet(void) {
  struct packet done = {
    .kind = PK_DONE,
    .seq_no = 0,
    .data = { 0 }
  };
  return done;
}

void get_data(state *st, uint16_t sn, uint8_t *buf) {
  for(int i = 0; i < 5; i++) {
    buf[i] = (uint8_t)i;
  }
}

void error(state *st, char *message) {
  fprintf(stderr, "Client exiting with reason: %s\n", message);
  exit(1);
}
