#include "lock.h"

void do_work(void);
lock_t lock;

void lock_init(lock_t *lock) {
}

bool lock_acquire(lock_t *lock) {
  static int spin_count = 10;

  if(spin_count-- == 0) {
    spin_count = 10;
    return true;
  }

  return false;
}

void lock_release(lock_t *lock) {
}

void lock_free(lock_t *lock) {
}

int main(void) {
  TESLA_WITHIN(main, strict(eventually(
    acq_rel(&lock)
  )));
  
  lock_init(&lock);

  do_work();

  lock_free(&lock);
  return 0;
}
