#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#include "lock.h"

#define LOCK true

static lock_t lock;

struct thread_args {
  int id;
};

void *thread_say(void *args) {
  struct thread_args *data = (struct thread_args *)args;

  if(LOCK)
    while(!lock_acquire(&lock)) {}

  for(int i = 0; i < 5; i++) {
    for(volatile int x = 0; x < 10000; x++) {}
    printf("Hello from thread %d\n", data->id);
  }

  if(LOCK)
    lock_release(&lock);

  pthread_exit(0);
}

int main(void) {
  lock_init(&lock);

  pthread_t thread0, thread1;
  struct thread_args args0 = { 0 };
  struct thread_args args1 = { 1 };

  pthread_create(&thread0, NULL, thread_say, &args0);
  pthread_create(&thread1, NULL, thread_say, &args1);

  pthread_join(thread0, NULL);
  pthread_join(thread1, NULL);

  return 0;
}
