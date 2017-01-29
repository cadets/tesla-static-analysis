#include "lock.h"

/**
 * Lock function implementations
 * 
 * In this program, the lock functions are stubs that do not actually perform
 * any locking. Instead, they mock out the correct behaviour of a lock.
 *
 * This program should fail its TESLA assertions for releasing the lock multiple
 * times.
 */

lock_t lock;

void baz(void) {
  lock_release(&lock);
}

void bar(void) {
  baz();
}

void foo(void) {
  bar();
}

void do_work(void) {
  while(!lock_acquire(&lock)) {}
  lock_release(&lock);
  lock_release(&lock);
  foo();
}
