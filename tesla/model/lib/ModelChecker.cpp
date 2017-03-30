#include <numeric>
#include <map>
#include <vector>

#include "Debug.h"
#include "GraphTransforms.h"
#include "Inference.h"
#include "ModelChecker.h"
#include "ModelGenerator.h"
#include "SequenceExpressions.h"

using std::map;
using std::vector;

bool ModelChecker::IsUsageSafe(const tesla::Usage *use) {
  auto automaton = Manifest->FindAutomaton(use->identifier());
  auto expr = automaton->getAssertion().expression();

  auto Gen = ModelGenerator(expr, Manifest);
  auto n = Gen.ofLength(Depth * 2); // generate longer model for cyclic checks

  auto allTraces = FiniteTraces{Graph}.OfLengthUpTo(Depth);
  auto boundedTraces = FiniteTraces::BoundedBy(allTraces, Bound);
  auto cyclicTraces = FiniteTraces::Cyclic(allTraces);

  auto safe = true; 

  for(auto trace : boundedTraces) {
    auto filt = filteredTrace(trace, expr);

    auto exists = false;
    for(auto model : n) {
      exists = exists || CheckAgainst(filt, model);
    }
    safe = safe && exists;
  }

  for(auto trace : cyclicTraces) {
    auto filt = filteredTrace(trace, expr);

    auto exists = false;
    for(auto model : n) {
      exists = exists || CheckAgainst(filt, model, true);
    }
    safe = safe && exists;
  }


  return safe;
}

set<const tesla::Usage *> ModelChecker::SafeUsages() {
  set<const tesla::Usage *> safeUses;

  for(auto use : Manifest->RootAutomata()) {
    if(IsUsageSafe(use)) {
      safeUses.insert(use);
    }
  }

  return safeUses;
}

bool ModelChecker::CheckAgainst(const FiniteTraces::Trace &tr, const ModelGenerator::Model &mod, bool cycle) {
  if(!cycle) {
    if(tr.size() != mod.size()) {
      return false;
    }
  } else {
    if(tr.size() > mod.size()) {
      return false;
    }
  }

  auto match = true;
  for(auto i = 0; i < tr.size(); i++) {
    match = match && CheckState(*mod[i], tr[i]);
  }

  return match && CheckReturnValues(tr, mod);
}

bool ModelChecker::hasReturnConstraint(Expression *e) {
  if(e->type() != Expression_Type_FUNCTION) {
    return false;
  }

  auto func = e->function();
  if(!func.has_direction() || func.direction() != FunctionEvent_Direction_Exit) {
    return false;
  }

  if(!func.has_expectedreturnvalue()) {
    return false;
  }

  auto ret = func.expectedreturnvalue();
  return ret.type() == Argument_Type_Constant && ret.has_value();
}

int ModelChecker::getReturnConstraint(Expression *e) {
  return e->function().expectedreturnvalue().value();
}

bool ModelChecker::CheckReturnValues(const FiniteTraces::Trace &tr, const ModelGenerator::Model &mod) {
  assert(mod.size() >= tr.size() && "Can't do RVC if model shorter than trace");
  // How do we want to go about doing the checking in this part of the model
  // checker? the trace describes a vector of events, and the model gives a
  // vector of assertions. We only care about the assertions with an associated
  // return value, so we should first filter those out using the associate
  // protobuf information

  auto constraints = std::vector<BoolValue>{};
  for(auto i = 0; i < tr.size(); i++) {
    if(auto exe = dyn_cast<ExitEvent>(tr[i])) {
      if(exe->Call && hasReturnConstraint(mod[i])) {
        constraints.push_back(
            BoolValue{exe->Call, static_cast<bool>(getReturnConstraint(mod[i]))});
      }
    }
  }

  if(constraints.empty()) {
    return true;
  }

  BBGraph->transform(GraphTransforms::DeleteEntryExit);
  Event *root = nullptr;

  for(auto ev : BBGraph->getEvents()) {
    auto bb = cast<BasicBlockEvent>(ev);
    auto found = std::find_if(bb->Inferences.begin(), bb->Inferences.end(),
      [=](BoolValue *b) {
        return *b == constraints[0];
      }
    );

    if(found != bb->Inferences.end()) {
      root = ev;
      break;
    }
  }

  if(!root) { 
    return false;
  }

  auto ft = FiniteTraces{BBGraph, root};
  auto ts = ft.OfLengthUpTo(Depth);

  for(auto t : ts) {
    decltype(t) withInf;
    std::copy_if(t.begin(), t.end(), std::back_inserter(withInf),
      [=](Event *e) {
        auto bbe = dyn_cast<BasicBlockEvent>(e);
        return bbe && !bbe->Inferences.empty();
      }
    );

    if(withInf.size() == constraints.size()) {
      auto all = true;

      for(auto i = 0; i < withInf.size(); i++) {
        auto ev = cast<BasicBlockEvent>(withInf[i]);
        auto any = std::any_of(ev->Inferences.begin(), ev->Inferences.end(),
          [=](BoolValue *b) {
            return *b == constraints[i];
          }
        );

        all = all && any;
      }

      if(all) {
        return true;
      }
    }
  }

  return false;
}

bool ModelChecker::CheckState(const tesla::Expression &ex, Event *event) {
   switch(ex.type()) {
    case tesla::Expression_Type_ASSERTION_SITE:
      return CheckAssertionSite(ex.assertsite(), event);

    case tesla::Expression_Type_FUNCTION:
      return CheckFunction(ex.function(), event);

    default:
      assert(false && "This should not happen");
      return false;
  }
}

bool ModelChecker::CheckAssertionSite(const tesla::AssertionSite &ex, Event *event) {
  if(auto ae = dyn_cast<AssertEvent>(event)) {
    if(ex.location() == ae->Location()) {
      return true;
    }
  }

  return false;
}

bool ModelChecker::CheckFunction(const tesla::FunctionEvent &ex, Event *event) {
  auto modFn = Mod->getFunction(ex.function().name());

  if(auto ent = dyn_cast<EntryEvent>(event)) {
    if(ex.direction() == tesla::FunctionEvent_Direction_Entry) {
      if(modFn && ent->Func && modFn == ent->Func) {
        return true;
      }
    }
  }

  if(auto exit = dyn_cast<ExitEvent>(event)) {
    if(ex.direction() == tesla::FunctionEvent_Direction_Exit) {
      if(modFn && exit->Func && modFn == exit->Func) {
        return true;
      }
    }
  }

  return false;
}

FiniteTraces::Trace ModelChecker::filteredTrace(const FiniteTraces::Trace &tr, const tesla::Expression ex) {
  auto subExprs = SubExpressions(*Manifest).Get(ex);

  FiniteTraces::Trace filt;

  for(auto ev : tr) {
    for(auto sub : subExprs) {
      if(CheckState(*sub, ev)) {
        filt.push_back(ev);
        break;
      }
    }
  }

  return filt;
}
