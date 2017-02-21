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

/**
 * Collects all the checked expressions from the expression then reduces them
 * according to the operation in the expression (and / or / xor).
 */
bool ModelChecker::CheckBoolean(const tesla::BooleanExpr &ex, Event *st) {
  return false;
}

/**
 * Because sequences can have an arbitrary number of events in them, we need to
 * separate it out into a head / tail (if possible), then check the splits
 * appropriately.
 */
bool ModelChecker::CheckSequence(const tesla::Sequence &ex, Event *st) {
  return false;
}

/**
 * Any state satisfies a null expression.
 */
bool ModelChecker::CheckNull(Event *st) {
  return true;
}

/**
 * Check passes in the state if we have the same location attached to an
 * assert event.
 */
bool ModelChecker::CheckAssertionSite(const tesla::AssertionSite &ex, Event *st) {
  return false;
}

/**
 * When checking a function event, we look up the function named by the event in
 * our module, then see if it's the same as the one on the event (but only if
 * the event is an entry / exit event with the correct direction).
 */
bool ModelChecker::CheckFunction(const tesla::FunctionEvent &ex, Event *st) {
  return false;
}

/**
 * Currently no state can satisfy a field assignment, but this might be changed
 * in the future when the event graph mechanism is upgraded.
 */
bool ModelChecker::CheckFieldAssign(const tesla::FieldAssignment &ex, Event *st) {
  return false;
}

/**
 * Subautomaton checking just recurses into the named automaton's logical
 * expression at the current state.
 */
bool ModelChecker::CheckSubAutomaton(const tesla::Automaton &ex, Event *st) {
  return CheckState(ex.getAssertion().expression(), st);
}
