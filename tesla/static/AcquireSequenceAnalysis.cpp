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
