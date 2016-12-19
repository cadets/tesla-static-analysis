#include "lock.h"

#include <pthread.h>
#include <tesla.h>
#include <tesla-macros.h>
#include <stdio.h>

void *thread_say(void *args);
int main(void);

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
