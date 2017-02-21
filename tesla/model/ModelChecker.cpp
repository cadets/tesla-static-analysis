#include "ModelChecker.h"

set<const tesla::Usage *> ModelChecker::SafeUsages() {
  set<const tesla::Usage *> safeUses;

  for(auto use : Manifest->RootAutomata()) {
    auto automaton = Manifest->FindAutomaton(use->identifier());
    auto expr = automaton->getAssertion().expression();
    
    auto entries = Graph->entries();
    auto safe = std::all_of(
      entries.begin(), entries.end(),
      [=](Event *ent) {
        return CheckState(expr, ent);
      }
    );
    
    if(safe) {
      safeUses.insert(use);
    }
  }

  return safeUses;
}

bool ModelChecker::CheckState(const tesla::Expression &ex, Event *st) {
  switch(ex.type()) {
    case tesla::Expression_Type_BOOLEAN_EXPR:
      return CheckBoolean(ex.booleanexpr(), st);

    case tesla::Expression_Type_SEQUENCE:
      return CheckSequence(ex.sequence(), st);

    case tesla::Expression_Type_NULL_EXPR:
      return CheckNull(st);

    case tesla::Expression_Type_ASSERTION_SITE:
      return CheckAssertionSite(ex.assertsite(), st);

    case tesla::Expression_Type_FUNCTION:
      return CheckFunction(ex.function(), st);

    case tesla::Expression_Type_FIELD_ASSIGN:
      return CheckFieldAssign(ex.fieldassign(), st);

    case tesla::Expression_Type_SUB_AUTOMATON:
      auto sub = Manifest->FindAutomaton(ex.subautomaton());
      return CheckSubAutomaton(*sub, st);
  }
}

bool ModelChecker::CheckBoolean(const tesla::BooleanExpr &ex, Event *st) {
  return false;
}

bool ModelChecker::CheckSequence(const tesla::Sequence &ex, Event *st) {
  return false;
}

bool ModelChecker::CheckNull(Event *st) {
  return false;
}

bool ModelChecker::CheckAssertionSite(const tesla::AssertionSite &ex, Event *st) {
  return false;
}

bool ModelChecker::CheckFunction(const tesla::FunctionEvent &ex, Event *st) {
  return false;
}

bool ModelChecker::CheckFieldAssign(const tesla::FieldAssignment &ex, Event *st) {
  return false;
}

bool ModelChecker::CheckSubAutomaton(const tesla::Automaton &ex, Event *st) {
  return false;
}
