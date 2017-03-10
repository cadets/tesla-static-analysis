#include <assert.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "server_handler.h"
#include "server_lock.h"

#ifdef TESLA
#include "tesla-macros.h"

void *write_to_fd(void *data);

#define HANDLER() \
  TESLA_WITHIN(write_to_fd, TSEQUENCE( \
    call(handle_connection), \
    TESLA_ASSERTION_SITE, \
    returnfrom(handle_connection) \
  ))

#define REPEATED_HANDLER() \
  TESLA_WITHIN(write_to_fd, TSEQUENCE( \
    call(handle_connection), \
    REPEAT(1, ANY_REP, TESLA_ASSERTION_SITE), \
    returnfrom(handle_connection) \
  ))
#endif

void handle_connection(int fd) {
  printf("Starting connection [%d]\n", fd);

  state *st = calloc(1, sizeof(*st));
  st->socket = fd;
  st->n_packets = 0;

  expect_request(st);
}

void expect_request(state *st) {
  HANDLER();

  struct packet p = next_packet(st->socket);

  if(p.kind == PK_REQUEST) {
    st->n_packets = p.seq_no;
    send_packet(st->socket, permit_packet(p.seq_no));
    expect_data(st);
  } else {
    error(st, "Not a request");
  }
}

void expect_data(state *st) {
  for(uint16_t i = 0; i < st->n_packets; i++) {
    struct packet p = next_packet(st->socket);

    if(p.kind == PK_DATA) {
      if(p.seq_no != i) {
        error(st, "Out of sequence");
      }

      struct packet ack = {
        .kind = PK_ACK,
        .seq_no = i,
        .data = { 0 }
      };
      send_packet(st->socket, ack);
    } else {
      error(st, "Not a data packet");
    }
  }

  expect_done(st);
}

void expect_done(state *st) {
  struct packet p = next_packet(st->socket);

  if(p.kind == PK_DONE) {
    success(st);
  } else {
    error(st, "Not a done packet");
  }
}

void success(state *st) {
  printf("Successful connection! [%d]\n", st->socket);
}

void error(state *st, char *message) {
  fprintf(stderr, "Server thread exiting with error: %s\n", message);
  pthread_exit(0);
}

struct packet permit_packet(uint16_t n) {
  struct packet p = {
    .kind = PK_PERMIT,
    .seq_no = n,
    .data = { 0 }
  };

  return p;
}
