#include "lock.h"

#include <pthread.h>
#include <tesla.h>
#include <tesla-macros.h>
#include <stdio.h>

void *thread_say(void *args);
int main(void);

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

void lock_free(lock_t *lock) {
}

#ifdef __TESLA_ANALYSER__

automaton(lifetime, lock_t *lock) {
  call(lock_init(lock));
  returnfrom(lock_free(lock));
  tesla_done;
}

automaton(acq_rel, lock_t *lock) {
  acquire(lock);
  release(lock);
  tesla_done;
}

automaton(acquire, lock_t *lock) {
  optional(ATLEAST(1, lock_acquire(lock) == false));
  lock_acquire(lock) == true;
  tesla_done;
}

automaton(release, lock_t *lock) {
  returnfrom(lock_release(lock));
  tesla_done;
}

#endif
