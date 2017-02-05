#include "CallsFunctionOnce.h"

#include <llvm/Analysis/Dominators.h>

bool tesla::CallsFunctionOnce(Function *callee, Function *caller) {
  DominatorTree DT;
  DT.runOnFunction(*caller);

  return false;
}

set<ReturnInst *> tesla::FunctionExits(Function *f) {
  set<ReturnInst *> ret;

  for(auto &BB : *f) {
    for(auto &I : BB) {
      if(auto ri = dyn_cast<ReturnInst>(&I)) {
        ret.insert(ri);
      }
    }
  }

  return ret;
}
