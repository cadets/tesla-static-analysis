#ifndef FINITE_TRACES_H
#define FINITE_TRACES_H

#include <map>
#include <set>
#include <vector>

#include "EventGraph.h"

using std::map;
using std::set;
using std::vector;

struct FiniteTraces {
  using Trace = vector<Event *>;
  using TraceSet = set<Trace>;

  FiniteTraces(EventGraph *eg) :
    Graph(eg) {}

  TraceSet OfLength(size_t len);
private:
  map<size_t, TraceSet> cache;
  EventGraph *Graph;
};

#endif
