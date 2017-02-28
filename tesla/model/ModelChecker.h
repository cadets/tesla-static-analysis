#ifndef MODEL_CHECKER_H
#define MODEL_CHECKER_H

#include "Manifest.h"
#include "tesla.pb.h"

#include <set>

#include "EventGraph.h"
#include "FiniteTraces.h"

using std::set;
using namespace llvm;

struct CheckResult {
  size_t Length() const { 
    assert(Successful_ && "No length if failure!");
    return Length_; 
  }
  bool Successful() const { return Successful_; }

  static CheckResult Failed() {
    return CheckResult(0, false);
  }

  static CheckResult Success(size_t len) {
    return CheckResult(len, true);
  }

private:
  size_t Length_;
  bool Successful_;

  CheckResult(size_t len, bool suc) :
    Length_(len), Successful_(suc) {}
};

struct ModelChecker {
  ModelChecker(EventGraph *gr, Module *mod, tesla::Manifest *man) :
    Graph(gr), Mod(mod), Manifest(man) {}

  set<const tesla::Usage *> SafeUsages();

private:
  bool CheckState(const tesla::Expression &ex, const FiniteTraces::Trace &, int);

  bool CheckBoolean(const tesla::BooleanExpr &ex, const FiniteTraces::Trace &, int);
  bool CheckSequence(const tesla::Sequence &ex, const FiniteTraces::Trace &, int);
  bool CheckNull(const FiniteTraces::Trace &, int);
  bool CheckAssertionSite(const tesla::AssertionSite &ex, const FiniteTraces::Trace &, int);
  bool CheckFunction(const tesla::FunctionEvent &ex, const FiniteTraces::Trace &, int);
  bool CheckFieldAssign(const tesla::FieldAssignment &ex, const FiniteTraces::Trace &, int);
  bool CheckSubAutomaton(const tesla::Automaton &ex, const FiniteTraces::Trace &, int);

  EventGraph *Graph;
  Module *Mod;
  tesla::Manifest *Manifest;
};

#endif
