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
    Graph(gr), BBGraph(EventGraph::ExpandedBasicBlockGraph(bound, d)), Mod(mod), 
    Manifest(man), Bound(bound), Depth(d)
  {
    for(auto ev : BBGraph->getEvents()) {
      if(auto bb = dyn_cast<BasicBlockEvent>(ev)) {
        auto fs = FollowSet(bb);
        for(auto inf : bb->Inferences) {
          for(auto follow : fs) {
            AssertionPairs.insert(std::make_pair(*inf, follow));
          }
        }
      }
    }
  }

  bool IsUsageSafe(const tesla::Usage *use);
  set<const tesla::Usage *> SafeUsages();

private:
  bool CheckAgainst(const FiniteTraces::Trace &tr, const ModelGenerator::Model &mod, bool cycle=false);

  static bool hasReturnConstraint(Expression *e);
  static int getReturnConstraint(Expression *e);

  set<BoolValue> FollowSet(Event *e);
  set<BoolValue> FollowSet(Event *e, std::set<Event *> &cache);
  bool ConstraintsOccur(EventGraph *eg, std::vector<BoolValue> constraints);
  bool CheckReturnValues(const FiniteTraces::Trace &tr, const ModelGenerator::Model &mod);
  bool ReturnConstraintSearch(std::vector<BoolValue> &constraints, int index, Event *root);

  bool CheckState(const tesla::Expression &ex, Event *);
  bool CheckAssertionSite(const tesla::AssertionSite &ex, Event *);
  bool CheckFunction(const tesla::FunctionEvent &ex, Event *);

  FiniteTraces::Trace filteredTrace(const FiniteTraces::Trace &tr, const tesla::Expression ex);

  EventGraph *Graph;
  EventGraph *BBGraph;
  std::set<std::pair<BoolValue, BoolValue>> AssertionPairs;

  Module *Mod;
  tesla::Manifest *Manifest;
  Function *Bound;
  int Depth;
};

#endif
