#include "lock.h"
#include "stdio.h"

/**
 * Lock function implementations
 * 
 * In this program, the lock functions are stubs that do not actually perform
 * any locking. Instead, they mock out the correct behaviour of a lock.
 *
 * This example will fail its TESLA assertions for acquiring a different lock to
 * the one mentioned in the test harness.
 */

lock_t lock;
lock_t other;

void do_work(void) {
  lock_init(&other);

  while(!lock_acquire(&other)) {}
  lock_release(&other);

  lock_free(&other);
}
