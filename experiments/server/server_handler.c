#include <assert.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "protocol_impl.h"
#include "server_lock.h"

#ifdef TESLA
#include "tesla-macros.h"

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

pthread_mutex_t lock;
void handle_connection(int fd);
void *write_to_fd(void *data);

void handle_connection(int fd) {
  printf("Starting connection [%d]\n", fd);
}
