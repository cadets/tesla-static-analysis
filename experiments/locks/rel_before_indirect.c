#include "lock.h"

/**
 * Lock function implementations
 * 
 * In this program, the lock functions are stubs that do not actually perform
 * any locking. Instead, they mock out the correct behaviour of a lock.
 */

lock_t lock;

void acq() {
  while(!lock_acquire(&lock)) {}
}

void rel() {
  lock_release(&lock);
  acq();
}

void do_work(void) {
  acq();
  rel();
}
