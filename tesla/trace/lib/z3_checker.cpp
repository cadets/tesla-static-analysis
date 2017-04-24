#include "z3_checker.h"

bool Z3Checker::check_usage(const tesla::Usage *use)
{
  auto automaton = manifest_.FindAutomaton(use->identifier());
  auto expr = automaton->getAssertion().expression();

  //auto fsm = ModelGenerator(expr, Manifest).FSM().Deterministic().Relabeled();
  return false;
}
