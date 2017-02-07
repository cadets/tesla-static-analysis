#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "lock.h"

/**
 * Lock function implementations
 *
 * In this version, these functions actually perform locking rather than being
 * mocked out.
 */

#define N_DATA 100000
int data[N_DATA];

void lock_init(lock_t *lock) {
  atomic_init(&(lock->locked), false);
}

bool lock_acquire(lock_t *lock) {
  bool f = false;
  return atomic_compare_exchange_strong(&(lock->locked), &f, true);
}

void lock_release(lock_t *lock) {
  lock->locked = false;
}

void lock_free(lock_t *lock) {
}

/**
 * Program that demonstrates the lock automata working on a real program with
 * threads and locking.
 */

static lock_t lock;

struct thread_args {
  int id;
  int start;
  int num;
};

void bubble_sort(int start, int num) {
  int end = start + num;
  bool swapped;

  do {
    swapped = false;

    for(int i = start + 1; i < end; i++) {
      if(data[i-1] > data[i]) {
        int tmp = data[i-1];
        data[i-1] = data[i];
        data[i] = tmp;
        swapped = true;
      }
    }

    end -= 1;
  } while(swapped);
}

bool verify_sort(int start, int num) {
  bool sorted = true;
  for(int i = start; i < start + num - 1; i++) {
    if(data[i] > data[i+1]) {
      sorted = false;
    }
  }
  return sorted;
}

void thread_task(int start, int num) {
  bubble_sort(start, num);
}

void *thread_work(void *args) {
  struct thread_args *ag = (struct thread_args *)args;

  TESLA_WITHIN(thread_work, strict(eventually(
    acq_rel(&lock),
    returnfrom(thread_work)
  )));

  while(!lock_acquire(&lock)) {}

  thread_task(ag->start, ag->num);
  bool s = verify_sort(ag->start, ag->num);
  fprintf(stderr, 
          "Interval [%d, %d) sorted: %s\n", 
          ag->start, ag->start + ag->num, s ? "t" : "f");

  lock_release(&lock);
  pthread_exit(0);
}

int main(void) {
  srand(time(NULL));
  for(int i = 0; i < N_DATA; i++) {
    data[i] = rand() % 100;
  }

  TESLA_WITHIN(main, eventually(lifetime(&lock)));

  lock_init(&lock);

  const int N_THREADS = 20;
  const int N_SORT = 10000;
  //const int N_PER = N_DATA / N_THREADS;

  pthread_t ts[N_THREADS];
  for(int i = 0; i < N_THREADS; i++) {
    struct thread_args *arg = malloc(sizeof(*arg));
    arg->id = i;
    arg->start = rand() % (N_DATA - N_SORT);
    arg->num = N_SORT;
    pthread_create(&ts[i], NULL, thread_work, arg);
  }

  for(int i = 0; i < N_THREADS; i++) {
    pthread_join(ts[i], NULL);
  }

  lock_free(&lock);
  return 0;
}
