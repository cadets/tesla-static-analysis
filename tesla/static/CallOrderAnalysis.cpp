#include "CallOrderAnalysis.h"

#include <llvm/Support/raw_ostream.h>

bool CallOrderAnalysis::run() {
  for(auto rel : Releasers()) {
    auto afterRels = CG.TransitiveCalls(rel);
    auto reach = CG.TransitiveCalls(&Bound);
    if(std::find(reach.begin(), reach.end(), rel) == reach.end()) {
      continue;
    }

    for(auto acq : Acquirers()) {
      if(std::find(afterRels.begin(), afterRels.end(), acq) != afterRels.end()) {
        AddMessage("Indirect release before acquire");
        return true;
      }
    }
  }

  return false;
}

vector<Function *> CallOrderAnalysis::Acquirers() {
  vector<Function *> ret{};

  auto acqFn = Mod.getFunction("lock_acquire");
  for(auto &F : Mod) {
    auto calls = CG.Calls(&F);

    if(std::find(calls.begin(), calls.end(), acqFn) != calls.end()) {
      ret.push_back(&F); 
    }
  }

  return ret;
}

vector<Function *> CallOrderAnalysis::Releasers() {
  vector<Function *> ret{};

  auto relFn = Mod.getFunction("lock_release");
  for(auto &F : Mod) {
    auto calls = CG.Calls(&F);

    if(std::find(calls.begin(), calls.end(), relFn) != calls.end()) {
      ret.push_back(&F); 
    }
  }

  return ret;
}
