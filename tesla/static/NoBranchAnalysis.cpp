#include "NoBranchAnalysis.h"

#include <llvm/IR/InstrTypes.h>

#include <queue>

bool NoBranchAnalysis::run() {
  bool allBranch = true;

  auto calls = AcquireCalls();
  for(auto call : calls) {
    bool hasBranch = false;

    std::queue<Value *> traces;
    std::for_each(call->use_begin(), call->use_end(),
      [&](Value *use) {
        traces.push(use);
      }
    );

    while(!traces.empty()) {
      auto use = traces.front();
      traces.pop();

      if(auto op = dyn_cast<BinaryOperator>(use)) {
        std::for_each(op->use_begin(), op->use_end(),
          [&](Value *use) {
            traces.push(use);
          }
        );
      }

      if(isa<BranchInst>(use)) {
        hasBranch = true;
      }
    }

    if(!hasBranch) {
      AddMessage("Found acquire call with no branches - lock usage might be incorrect");
      auto DI = call->getDebugLoc();
      AddMessage("The call location is: " +
                 Mod.getModuleIdentifier() + ":" + 
                 call->getParent()->getParent()->getName().str() + ":" +
                 std::to_string(DI.getLine()));
    }

    allBranch = hasBranch && allBranch;
  }

  return !allBranch;
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
