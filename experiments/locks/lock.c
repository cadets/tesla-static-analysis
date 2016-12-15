#include "lock.h"

#include <stdio.h>

void lock_init(lock_t *lock) {
  atomic_init(&(lock->locked), false);
}

bool lock_acquire(lock_t *lock) {
  bool f = false;
  return atomic_compare_exchange_strong(&(lock->locked), &f, true);
}

void lock_release(lock_t *lock) {
  lock->locked = false;
}
