#include "NoBranchAnalysis.h"

bool NoBranchAnalysis::run() {
  auto x = AcquireCalls();
  return false;
}

std::set<CallInst *> NoBranchAnalysis::AcquireCalls() {
  auto acqFn = Mod.getFunction("lock_acquire");
  std::set<CallInst *> calls;

  for(auto &F : Mod) {
    for(auto &BB : F) {
      for(auto &I : BB) {
        if(isa<CallInst>(I)) {
          auto &call = cast<CallInst>(I);
          const auto fn = call.getCalledFunction();
          if(fn && !fn->isDeclaration() && fn == acqFn) {
            calls.insert(&call);
          }
        }
      }
    }
  }

  return calls;
}
