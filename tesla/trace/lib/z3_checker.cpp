#include <llvm/Support/raw_ostream.h>

#include "FSMBuilder.h"
#include "z3_checker.h"

bool Z3Checker::check_usage(const tesla::Usage *use)
{
  if(!has_checkable_bounds(use)) {
    return false;
  }

  auto automaton = manifest_.FindAutomaton(use->identifier());
  auto expr = automaton->getAssertion().expression();

  auto fsm = FSMBuilder(expr, &manifest_).FSM().Deterministic().Relabeled();
  return false;
}

bool Z3Checker::has_checkable_bounds(const tesla::Usage *use) const
{
  const auto& begin = use->beginning();
  const auto& end = use->end();

  if(begin.type() != Expression_Type_FUNCTION ||
     end.type() != Expression_Type_FUNCTION) {
    return false;
  }

  const auto& begin_event = begin.function();
  const auto& end_event = end.function();
  
  if(begin_event.direction() != FunctionEvent_Direction_Entry ||
     end_event.direction() != FunctionEvent_Direction_Exit) {
    return false;
  }

  return begin_event.function().name() == end_event.function().name();
}

Function *Z3Checker::bound_function(const tesla::Usage *use) const
{
  if(!has_checkable_bounds(use)) {
    return nullptr;
  }

  return module_.getFunction(use->end().function().function().name());
}
