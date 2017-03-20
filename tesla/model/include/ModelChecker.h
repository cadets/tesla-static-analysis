#ifndef MODEL_CHECKER_H
#define MODEL_CHECKER_H

#include "Manifest.h"
#include "tesla.pb.h"

#include <map>
#include <set>
#include <sstream>
#include <vector>

#include "EventGraph.h"
#include "FiniteTraces.h"
#include "ModelGenerator.h"

using std::map;
using std::pair;
using std::set;
using std::vector;
using namespace llvm;

struct ModelChecker {
  ModelChecker(EventGraph *gr, Module *mod, tesla::Manifest *man, Function *bound, int d) :
    Graph(gr), Mod(mod), Manifest(man), Bound(bound), Depth(d) {}

  bool IsUsageSafe(const tesla::Usage *use);
  set<const tesla::Usage *> SafeUsages();

private:
  bool CheckAgainst(const FiniteTraces::Trace &tr, const ModelGenerator::Model &mod, bool cycle=false);

  bool CheckState(const tesla::Expression &ex, Event *);
  bool CheckAssertionSite(const tesla::AssertionSite &ex, Event *);
  bool CheckFunction(const tesla::FunctionEvent &ex, Event *);

  FiniteTraces::Trace filteredTrace(const FiniteTraces::Trace &tr, const tesla::Expression ex);

  EventGraph *Graph;
  Module *Mod;
  tesla::Manifest *Manifest;
  Function *Bound;
  int Depth;
};

#endif
