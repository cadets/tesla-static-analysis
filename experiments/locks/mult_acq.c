#include "lock.h"

/**
 * Lock function implementations
 * 
 * In this program, the lock functions are stubs that do not actually perform
 * any locking. Instead, they mock out the correct behaviour of a lock.
 *
 * This program should fail its TESLA assertions for attempting to acquire the
 * lock after a successful acquisition.
 */

lock_t lock;

void do_work() {
  while(!lock_acquire(&lock)) {}
  while(!lock_acquire(&lock)) {}
  lock_release(&lock);
}
