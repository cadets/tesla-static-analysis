#include "lock.h"

/**
 * Lock function implementations
 * 
 * In this program, the lock functions are stubs that do not actually perform
 * any locking. Instead, they mock out the correct behaviour of a lock.
 *
 * This program should fail its TESLA assertions by not acquiring the lock
 * before entering the critical section.
 */

lock_t lock;

void do_work() {
  lock_release(&lock);
}
