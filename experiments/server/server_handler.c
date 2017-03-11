#include <assert.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "server_handler.h"
#include "server_lock.h"

pthread_mutex_t lock;

void lock_file() { pthread_mutex_lock(&lock); }
void unlock_file() { pthread_mutex_unlock(&lock); }

#ifdef TESLA

#include "tesla-macros.h"

void *write_to_fd(void *data);

#define tesla_handle_only() \
  TESLA_WITHIN(write_to_fd, TSEQUENCE( \
    call(handle_connection), \
    TESLA_ASSERTION_SITE, \
    returnfrom(handle_connection) \
  ))

#endif

void handle_connection(int fd) {
#ifdef USE_TESLA
  TESLA_WITHIN(write_to_fd,
    TSEQUENCE(
      TESLA_ASSERTION_SITE,
      ATLEAST(1, TSEQUENCE(
        call(lock_file),
        call(unlock_file)
      )),
      returnfrom(handle_connection)
    )
  );
#endif

  printf("Starting connection [%d]\n", fd);

  state *st = calloc(1, sizeof(*st));
  st->socket = fd;
  st->n_packets = 0;

  expect_request(st);

  free(st->buffer);
  free(st);
}

void expect_request(state *st) {
#ifdef USE_TESLA
  tesla_handle_only();

  TESLA_WITHIN(write_to_fd,
    TSEQUENCE(
      call(expect_request),
      TESLA_ASSERTION_SITE,
      TSEQUENCE(
        call(expect_data)
      ) || call(error),
      returnfrom(expect_request)
    )
  );
#endif

  struct packet p = next_packet(st->socket);

  if(p.kind == PK_REQUEST) {
    st->n_packets = p.seq_no;
    st->buffer = calloc(p.seq_no*5, sizeof(uint8_t));

    lock_file();
    FILE *log = fopen("server.log", "a");
    fprintf(log, "Received a request for %d packets\n", p.seq_no);
    fclose(log);
    unlock_file();

    send_packet(st->socket, permit_packet(p.seq_no));
    expect_data(st);
  } else {
    error(st, "Not a request");
  }
}

void expect_data(state *st) {
#ifdef USE_TESLA
  tesla_handle_only();

  TESLA_WITHIN(write_to_fd,
    TSEQUENCE(
      call(expect_data),
      TESLA_ASSERTION_SITE,
      call(expect_done) || call(error),
      returnfrom(expect_data)
    )
  );
#endif

  for(uint16_t i = 0; i < st->n_packets; i++) {
    struct packet p = next_packet(st->socket);

    if(p.kind == PK_DATA) {
      if(p.seq_no != i) {
        error(st, "Out of sequence");
      }

      lock_file();
      FILE *log = fopen("server.log", "a");
      fprintf(log, "Received data packet: [%d,%d] ", st->socket, i);
      
      for(int j = 0; j < 5; j++) {
        st->buffer[(i*5)+j] = p.data[j];
        fprintf(log, "%d ", p.data[j]);
      }

      fprintf(log, "\n");
      fclose(log);
      unlock_file();

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
#ifdef USE_TESLA
  tesla_handle_only();

  TESLA_WITHIN(write_to_fd,
    TSEQUENCE(
      call(expect_done),
      TESLA_ASSERTION_SITE,
      call(success) || call(error),
      returnfrom(expect_done)
    )
  );
#endif

  struct packet p = next_packet(st->socket);

  if(p.kind == PK_DONE) {
    success(st);
  } else {
    error(st, "Not a done packet");
  }
}

void success(state *st) {
#ifdef USE_TESLA
  tesla_handle_only();
#endif

  struct packet done = {
    .kind = PK_DONE,
    .seq_no = 0,
    .data = { 0 }
  };
  send_packet(st->socket, done);

  printf("Successful connection! [%d]\n", st->socket);
}

void error(state *st, char *message) {
#ifdef USE_TESLA
  tesla_handle_only();
#endif

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
