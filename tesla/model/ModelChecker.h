#ifndef MODEL_CHECKER_H
#define MODEL_CHECKER_H

#include "Manifest.h"
#include "tesla.pb.h"

#include <set>
#include <sstream>

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

  string str() const {
    std::stringstream ss;

    if(Successful()) {
      ss << "SUCCESS[" << Length() << "]";
    } else {
      ss << "FAIL";
    }

    return ss.str();
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

  CheckResult CheckState(const tesla::Expression &ex, const FiniteTraces::Trace &, int);
  CheckResult CheckState(const tesla::Expression &ex, const FiniteTraces::Trace &, size_t);
  CheckResult CheckBoolean(const tesla::BooleanExpr &ex, const FiniteTraces::Trace &, int);
  CheckResult CheckSequence(const tesla::Sequence &ex, const FiniteTraces::Trace &, int);
  CheckResult CheckSequenceOnce(const tesla::Sequence &ex, const FiniteTraces::Trace &, int, 
                                set<const tesla::Expression *> = {});
  CheckResult CheckNull(const FiniteTraces::Trace &, int);
  CheckResult CheckAssertionSite(const tesla::AssertionSite &ex, const FiniteTraces::Trace &, int);
  CheckResult CheckFunction(const tesla::FunctionEvent &ex, const FiniteTraces::Trace &, int);
  CheckResult CheckFieldAssign(const tesla::FieldAssignment &ex, const FiniteTraces::Trace &, int);
  CheckResult CheckSubAutomaton(const tesla::Automaton &ex, const FiniteTraces::Trace &, int);
  CheckResult CheckSubAutomaton(const tesla::Automaton &ex, const FiniteTraces::Trace &, size_t);

  EventGraph *Graph;
  Module *Mod;
  tesla::Manifest *Manifest;
};

#endif
