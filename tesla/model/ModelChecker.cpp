#include <numeric>
#include <map>
#include <vector>

#include "Debug.h"
#include "ModelChecker.h"
#include "ModelGenerator.h"
#include "SequenceExpressions.h"

using std::map;
using std::vector;

set<const tesla::Usage *> ModelChecker::SafeUsages() {
  set<const tesla::Usage *> safeUses;

  for(auto use : Manifest->RootAutomata()) {
    auto automaton = Manifest->FindAutomaton(use->identifier());
    auto expr = automaton->getAssertion().expression();

    auto Gen = ModelGenerator(expr, Manifest);
    auto n = Gen.ofLength(Depth + 1);

    auto allTraces = FiniteTraces{Graph}.OfLengthUpTo(Depth);
    auto boundedTraces = FiniteTraces::BoundedBy(allTraces, Bound);
    auto cyclicTraces = FiniteTraces::Cyclic(allTraces);

    auto subExprs = SubExpressions(*Manifest).Get(expr);

    auto safe = true; 

    for(auto trace : boundedTraces) {
      auto exists = false;
      for(auto model : n) {
        exists = exists || CheckAgainst(trace, model);
      }
      safe = safe && exists;
    }

    if(safe) {
      safeUses.insert(use);
    }
  }

  return safeUses;
}

bool ModelChecker::CheckAgainst(const FiniteTraces::Trace &tr, const ModelGenerator::Model &mod) {
  if(tr.size() != mod.size()) {
    errs() << "Differently sized trace and model: " << tr.size() << " " << mod.size() << '\n';
    return false;
  }

  return false;
}

bool ModelChecker::CheckState(const tesla::Expression &ex, Event *) {
  return false;
}

bool ModelChecker::CheckAssertionSite(const tesla::AssertionSite &ex, Event *) {
  return false;
}

bool ModelChecker::CheckFunction(const tesla::FunctionEvent &ex, Event *) {
  return false;
}
