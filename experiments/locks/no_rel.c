#include "lock.h"

/**
 * Lock function implementations
 * 
 * In this program, the lock functions are stubs that do not actually perform
 * any locking. Instead, they mock out the correct behaviour of a lock.
 *
 * This program should fail its TESLA assertion for not releasing the lock
 * before returning.
 */

lock_t lock;

void do_work() {
  while(!lock_acquire(&lock)) {}
}
