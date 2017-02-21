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
  return true;
}
