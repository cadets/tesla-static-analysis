#ifndef LOCK_H
#define LOCK_H

#include <stdbool.h>
#include <stdatomic.h>
#include <tesla.h>
#include <tesla-macros.h>

#include "annotate.h"

typedef struct lock_st {
  _Atomic(bool) locked;
} lock_t;

void lock_init(lock_t *lock);
bool lock_acquire(lock_t *lock);
void lock_release(lock_t *lock);
void lock_free(lock_t *lock);

#ifdef __TESLA_ANALYSER__

automaton(lifetime, lock_t *lock);
automaton(acq_rel, lock_t *lock);
automaton(acquire, lock_t *lock);
automaton(release, lock_t *lock);

#endif

#endif
