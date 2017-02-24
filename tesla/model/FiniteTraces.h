#ifndef FINITE_TRACES_H
#define FINITE_TRACES_H

#include <llvm/IR/Function.h>

#include <map>
#include <set>
#include <vector>

#include "EventGraph.h"

using std::map;
using std::set;
using std::vector;
using namespace llvm;

struct FiniteTraces {
  using Trace = vector<Event *>;
  using TraceSet = set<Trace>;

  FiniteTraces(EventGraph *eg) :
    Graph(eg) {}

  TraceSet OfLength(size_t len);
  TraceSet OfLengthUpTo(size_t len);

  static Trace BoundedBy(Trace t, Function *f);
  static TraceSet BoundedBy(TraceSet traces, Function *f);
private:
  map<size_t, TraceSet> cache;
  EventGraph *Graph;
};

#endif
