#include "ImplicationCheck.h"

bool Implication::Check(const Condition *c, BoolValue b) {
  auto not_b = *b.Negated();

  auto allBoolValues = c->BoolValues();
  std::set<BoolValue> extras;

  for(auto e : allBoolValues) {
    if ((e != b) && (e != not_b)) {
      extras.insert(e);
    }
  }

  std::vector<const Condition *> workingSet{c};

  for(auto branch : extras) {
    std::vector<const Condition *> updated;

    for(auto cond : workingSet) {
      updated.push_back(cond->Restricted(branch, new ConstTrue, new ConstFalse));
      updated.push_back(cond->Restricted(branch, new ConstFalse, new ConstTrue));
    }

    workingSet = updated;
  }

  return std::none_of(workingSet.begin(), workingSet.end(),
    [=](auto w) {
      auto val = w->Restricted(b, new ConstFalse, new ConstTrue);
      return val->Eval();
    }
  );
}

std::set<BoolValue> Implication::BoolValuesFrom(const Condition *c) {
  std::set<BoolValue> ret;

  for(auto branch : c->BoolValues()) {
    if(Implication::Check(c, branch)) {
      ret.insert(branch);
    }
  }

  return ret;
}
