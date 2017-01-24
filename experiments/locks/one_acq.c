#include "lock.h"

/**
 * Lock function implementations
 * 
 * In this program, the lock functions are stubs that do not actually perform
 * any locking. Instead, they mock out the correct behaviour of a lock.
 *
 * This program should fail its TESLA assertions for not checking that it
 * acquired the lock successfully.
 */

lock_t lock;

void do_work() {
  lock_acquire(&lock); 
  lock_release(&lock);
}
