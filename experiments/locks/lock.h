#ifndef LOCK_H
#define LOCK_H

#include <stdbool.h>
#include <stdatomic.h>

#include "annotate.h"

typedef struct lock_st {
  _Atomic(bool) TESLA_FIELD(locked, lock_st);
} lock_t;

void lock_init(lock_t *lock);
bool lock_acquire(lock_t *lock);
void lock_release(lock_t *lock);

#endif
