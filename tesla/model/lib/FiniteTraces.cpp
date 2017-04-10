#include <llvm/Support/raw_ostream.h>

#include "FiniteTraces.h"

FiniteTraces::TraceSet FiniteTraces::OfLength(size_t len) {
  // Look it up in the cache if we can - no set of traces will be computed more
  // than once for a single graph.
  {
    std::lock_guard<std::mutex> lock(cache_lock);
    if(cache.find(len) != cache.end()) {
      return cache[len];
    }
  }

  // No traces of length 0
  if(len == 0) {
    {
      std::lock_guard<std::mutex> lock(cache_lock);
      cache[0] = {};
    }
    return {};
  }

  // Traces of length 1 are just the entries to the graph
  if(len == 1) {
    if(!Root) {
      set<Trace> entries;
      for(auto e : Graph->entries()) {
        entries.insert({e});
      }

      {
        std::lock_guard<std::mutex> lock(cache_lock);
        cache[1] = entries;
      }
      return entries;
    } else {
      return {{Root}};
    }
  }

  auto preds = OfLength(len - 1);
  FiniteTraces::TraceSet ret = {};

  for(auto pred : preds) {
    auto last = pred.back();

    for(auto suc : last->successors) {
      auto newTrace = pred;
      newTrace.push_back(suc);
      ret.insert(newTrace);
    }
  }

  {
    std::lock_guard<std::mutex> lock(cache_lock);
    cache[len] = ret;
  }
  return ret;
}

FiniteTraces::TraceSet FiniteTraces::OfLengthUpTo(size_t len) {
  FiniteTraces::TraceSet traces;

  for(size_t i = 0; i < len; i++) {
    auto upto = OfLength(i);

    for(auto trace : upto) {
      traces.insert(trace);
    }
  }

  return traces;
}

FiniteTraces::Trace FiniteTraces::BoundedBy(Trace t, Function *f) {
  FiniteTraces::Trace bounded;
  bool started = false;

  for(auto ev : t) {
    if(auto ent = dyn_cast<EntryEvent>(ev)) {
      if(ent->Func == f) {
        started = true;
      }
    }

    if(started) {
      bounded.push_back(ev);
    }

    if(auto ex = dyn_cast<ExitEvent>(ev)) {
      if(ex->Func == f) {
        started = false;
        break;
      }
    }
  }

  if(started) {
    return {};
  } else {
    return bounded;
  }
}

FiniteTraces::TraceSet FiniteTraces::BoundedBy(TraceSet traces, Function *f) {
  FiniteTraces::TraceSet bounded;

  std::copy_if(traces.begin(), traces.end(), std::inserter(bounded, bounded.end()),
    [=](FiniteTraces::Trace t) {
      return !(BoundedBy(t, f).empty());
    }
  );

  return bounded;
}

FiniteTraces::Trace FiniteTraces::Cycle(Trace t) {
  if(t.empty()) {
    return {};
  }

  auto last = t.back();
  FiniteTraces::Trace cycle;

  for(auto it = t.rbegin(); it != t.rend(); it++) {
    if(*it == last && it != t.rbegin()) {
      break;
    }

    cycle.push_back(*it);
  }
  std::reverse(cycle.begin(), cycle.end());

  auto start = cycle.front();
  int ci = 0;
  bool check = false;

  for(int i = 0; i < t.size(); i++) {
    if(t[i] == start) {
      check = true;
      ci = i;
    }

    if(check && t[i] != cycle[(i - ci) % cycle.size()]) {
      return {};
    }
  }

  if(ci == 0) {
    return {};
  }

  return cycle;
}

FiniteTraces::TraceSet FiniteTraces::Cyclic(TraceSet traces) {
  FiniteTraces::TraceSet cyclic;

  std::copy_if(traces.begin(), traces.end(), std::inserter(cyclic, cyclic.end()),
    [=](FiniteTraces::Trace t) {
      return !(Cycle(t).empty());
    }
  );

  return cyclic;
}
