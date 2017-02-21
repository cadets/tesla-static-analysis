#ifndef MODEL_CHECKER_H
#define MODEL_CHECKER_H

#include "Manifest.h"
#include "tesla.pb.h"

#include <set>

#include "EventGraph.h"

using std::set;

struct ModelChecker {
  ModelChecker(EventGraph *gr, tesla::Manifest *man) :
    Graph(gr), Manifest(man) {}

  set<const tesla::Usage *> SafeUsages();

private:
  bool CheckState(const tesla::Expression &ex, Event *st);
  EventGraph *Graph;
  tesla::Manifest *Manifest;
};

#endif
