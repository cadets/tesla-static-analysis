#include "AcquireSequenceAnalysis.h"

bool AcquireSequenceAnalysis::run() {
  return false;
}

set<CallInst *> AcquireSequenceAnalysis::AcquireCalls() {
  auto acqFn = Mod.getFunction("lock_acquire");
  set<CallInst *> ret{};

  for(auto &F : Mod) {
    for(auto &BB : F) {
      for(auto &I : BB) {
        if(isa<CallInst>(I)) {
          auto &call = cast<CallInst>(I);
          if(call.getCalledFunction() == acqFn) {
            ret.insert(&call);
          }
        }
      }
    }
  }

  return ret;
}

map<CallInst *, set<Value *>> AcquireSequenceAnalysis::AcquireUsages() {
  auto calls = AcquireCalls();
  map<CallInst *, set<Value *>> usageMap{};

  for(auto call : calls) {
    set<Value *> usages;

    for(auto it = call->use_begin(); it != call->use_end(); it++) {
      usages.insert(*it);
    }

    usageMap[call] = usages;
  }

  return usageMap;
}

set<BranchLoc> AcquireSequenceAnalysis::trace(Value *usage) {
  return {};
}
