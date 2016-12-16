#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#include "lock.h"

static lock_t lock;

struct thread_args {
  int id;
};

void thread_say(int id) {
  while(!lock_acquire(&lock)) {}

  for(int i = 0; i < 5; i++) {
    for(volatile int x = 0; x < 10000; x++) {}
    printf("Hello from thread %d\n", id);
  }

  lock_release(&lock);
}

void *thread_work(void *args) {
  struct thread_args *data = (struct thread_args *)args;

  TESLA_WITHIN(thread_work, strict(eventually(
    acq_rel(&lock),
    returnfrom(thread_work)
  )));

  thread_say(data->id);

  pthread_exit(0);
}

int main(void) {
  TESLA_WITHIN(main, eventually(lifetime(&lock)));

  lock_init(&lock);

  pthread_t thread0, thread1;
  struct thread_args args0 = { 0 };
  struct thread_args args1 = { 1 };

  pthread_create(&thread0, NULL, thread_work, &args0);
  pthread_create(&thread1, NULL, thread_work, &args1);

  pthread_join(thread0, NULL);
  pthread_join(thread1, NULL);

  lock_free(&lock);
  return 0;
}
