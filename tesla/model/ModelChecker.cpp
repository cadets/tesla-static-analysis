#include <map>

#include "ModelChecker.h"

using std::map;

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

template<typename T>
std::function<bool(T, Event *)> ModelChecker::BoundChecker(CheckerFunc<T> f) {
  return std::bind(f, this, std::placeholders::_1, std::placeholders::_2);
}

template<typename T>
bool ModelChecker::allSuccessors(Event *ev, T item, CheckerFunc<T> checker) {
  if(ev->successors.size() == 0) {
    return false;
  }

  return std::all_of(ev->successors.begin(), ev->successors.end(),
    [=](Event *suc) {
      return BoundChecker<T>(checker)(item, suc);
    }
  );
}

/**
 * Collects all the checked expressions from the expression then reduces them
 * according to the operation in the expression (and / or / xor).
 */
bool ModelChecker::CheckBoolean(const tesla::BooleanExpr &ex, Event *st) {
  errs() << "bool\n";
  return false;
}

/**
 * Because sequences can have an arbitrary number of events in them, we need to
 * separate it out into a head / tail (if possible), then check the splits
 * appropriately. Also need to work out a way of extending to allow for reps to
 * be included - currently ignored (!)
 *
 * I *think* that sequences should be the sole way to handle recursing through
 * the graph - a one event sequence is equivalent to something like X[P] in LTL,
 * whereas every other type should just be checked at the current state.
 */
bool ModelChecker::CheckSequence(const tesla::Sequence &ex, Event *st) {
  errs() << "seq\n";
  static map<Event *, tesla::Sequence> tried;

  int size = ex.expression_size();
  
  // Degenerate sequence is always satisfied
  if(size == 0) {
    return true;
  }

  // If the head of the sequence holds here, get the tail of the sequence and
  // check it at all the successors.
  auto head = ex.expression(0);
  if(CheckState(head, st)) {
    auto tail = tesla::Sequence{};
    for(int i = 1; i < ex.expression_size(); i++) {
      *tail.add_expression() = ex.expression(i);
    }

    return allSuccessors<tesla::Sequence>(st, tail, &ModelChecker::CheckSequence);
  }

  // If we have already tried this sequence at this event, return false as it
  // will go into an infinite loop.
  if(tried.find(st) != tried.end()) {
    return false;
  }
  tried[st] = ex;

  // Check the sequence at all of the successors
  return allSuccessors<tesla::Sequence>(st, ex, &ModelChecker::CheckSequence);
}

/**
 * Any state satisfies a null expression.
 */
bool ModelChecker::CheckNull(Event *st) {
  errs() << "null\n";
  return true;
}

/**
 * Check passes in the state if we have the same location attached to an
 * assert event.
 */
bool ModelChecker::CheckAssertionSite(const tesla::AssertionSite &ex, Event *st) {
  errs() << "assert\n";

  if(auto ae = dyn_cast<AssertEvent>(st)) {
    return ex.location() == ae->Location();
  }

  return false;
}

/**
 * When checking a function event, we look up the function named by the event in
 * our module, then see if it's the same as the one on the event (but only if
 * the event is an entry / exit event with the correct direction).
 */
bool ModelChecker::CheckFunction(const tesla::FunctionEvent &ex, Event *st) {
  errs() << "func\n";
  return false;
}

/**
 * Currently no state can satisfy a field assignment, but this might be changed
 * in the future when the event graph mechanism is upgraded.
 */
bool ModelChecker::CheckFieldAssign(const tesla::FieldAssignment &ex, Event *st) {
  errs() << "assign\n";
  return false;
}

/**
 * Subautomaton checking just recurses into the named automaton's logical
 * expression at the current state.
 */
bool ModelChecker::CheckSubAutomaton(const tesla::Automaton &ex, Event *st) {
  errs() << "subauto\n";
  return CheckState(ex.getAssertion().expression(), st);
}
