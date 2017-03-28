#include "ImplicationCheck.h"

bool Implication::Check(Condition *c, Branch b) {
  auto not_b = *b.Negated();

  auto allBranches = c->Branches();
  std::set<Branch> extras;

  for(auto e : allBranches) {
    if ((e != b) && (e != not_b)) {
      extras.insert(e);
    }
  }

  return false;
}
