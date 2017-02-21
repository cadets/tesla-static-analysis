#ifndef MODEL_CHECKER_H
#define MODEL_CHECKER_H

#include "Manifest.h"
#include "tesla.pb.h"

#include <set>

#include "EventGraph.h"

using std::set;
using namespace llvm;

struct ModelChecker {
  ModelChecker(EventGraph *gr, Module *mod, tesla::Manifest *man) :
    Graph(gr), Mod(mod), Manifest(man) {}

  set<const tesla::Usage *> SafeUsages();

private:
  bool CheckState(const tesla::Expression &ex, Event *st);

  bool CheckBoolean(const tesla::BooleanExpr &ex, Event *st);
  bool CheckSequence(const tesla::Sequence &ex, Event *st);
  bool CheckNull(Event *st);
  bool CheckAssertionSite(const tesla::AssertionSite &ex, Event *st);
  bool CheckFunction(const tesla::FunctionEvent &ex, Event *st);
  bool CheckFieldAssign(const tesla::FieldAssignment &ex, Event *st);
  bool CheckSubAutomaton(const tesla::Automaton &ex, Event *st);

  EventGraph *Graph;
  Module *Mod;
  tesla::Manifest *Manifest;
};

#endif
