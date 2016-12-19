#include "lock.h"

/**
 * Lock function implementations
 * 
 * In this program, the lock functions are stubs that do not actually perform
 * any locking. Instead, they mock out the correct behaviour of a lock.
 */

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

void do_work() {
  while(!lock_acquire(&lock)) {}
  lock_release(&lock);
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
