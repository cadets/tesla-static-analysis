#ifndef MODEL_CHECKER_H
#define MODEL_CHECKER_H

#include "Manifest.h"
#include "tesla.pb.h"

#include <set>
#include <sstream>
#include <vector>

#include "EventGraph.h"
#include "FiniteTraces.h"

using std::pair;
using std::set;
using std::vector;
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
  using TaggedTrace = vector<pair<Event *, bool>>;

  ModelChecker(EventGraph *gr, Module *mod, tesla::Manifest *man, Function *bound, int d) :
    Graph(gr), Mod(mod), Manifest(man), Bound(bound), Depth(d) {}

  set<const tesla::Usage *> SafeUsages();

  void MarkIgnoredEvents(const tesla::Expression &ex, TaggedTrace &tr);

  CheckResult CheckState(const tesla::Expression &ex, TaggedTrace &, int);
  CheckResult CheckBoolean(const tesla::BooleanExpr &ex, TaggedTrace &, int);
  CheckResult CheckSequence(const tesla::Sequence &ex, TaggedTrace &, int);
  CheckResult CheckSequenceOnce(const tesla::Sequence &ex, TaggedTrace &, int, 
                                set<const tesla::Expression *> = {});
  CheckResult CheckNull(TaggedTrace &, int);
  CheckResult CheckAssertionSite(const tesla::AssertionSite &ex, TaggedTrace &, int);
  CheckResult CheckFunction(const tesla::FunctionEvent &ex, TaggedTrace &, int);
  CheckResult CheckFieldAssign(const tesla::FieldAssignment &ex, TaggedTrace &, int);
  CheckResult CheckSubAutomaton(const tesla::Automaton &ex, TaggedTrace &, int);

  static TaggedTrace tagged(const FiniteTraces::Trace);

  EventGraph *Graph;
  Module *Mod;
  tesla::Manifest *Manifest;
  Function *Bound;
  int Depth;
};

#endif
