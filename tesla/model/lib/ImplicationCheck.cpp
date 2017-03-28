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

  std::vector<Condition *> workingSet{c};

  for(auto branch : extras) {
    std::vector<Condition *> updated;

    for(auto cond : workingSet) {
      updated.push_back(cond->Restricted(branch, new ConstTrue, new ConstFalse));
      updated.push_back(cond->Restricted(branch, new ConstFalse, new ConstTrue));
    }

    workingSet = updated;
  }

  return std::none_of(workingSet.begin(), workingSet.end(),
    [=](Condition *w) {
      auto val = w->Restricted(b, new ConstFalse, new ConstTrue);
      return val->Eval();
    }
  );
}
