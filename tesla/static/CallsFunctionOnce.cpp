#include "CallsFunctionOnce.h"
#include "ReachabilityGraph.h"

#include <llvm/Analysis/Dominators.h>

bool tesla::CallsFunctionOnce(Function *callee, Function *caller) {
  ReachabilityGraph RG{*caller};

  auto exits = FunctionExits(caller);
  auto calls = CallsTo(callee, caller);
  if (!ExitsDominated(caller, exits, calls)) {
    return false;
  }

  return true;
}

bool tesla::ExitsDominated(Function *caller, set<ReturnInst *> exits,
                           set<CallInst *> calls) {
  DominatorTree DT;
  DT.runOnFunction(*caller);

  for (auto exit : exits) {
    int dominanceCount = 0;

    for (auto call : calls) {
      if (DT.dominates(call, exit)) {
        dominanceCount++;
      }
    }

    if (dominanceCount != 1) {
      return false;
    }
  }

  return true;
}

set<ReturnInst *> tesla::FunctionExits(Function *f) {
  set<ReturnInst *> ret;

  for (auto &BB : *f) {
    for (auto &I : BB) {
      if (auto ri = dyn_cast<ReturnInst>(&I)) {
        ret.insert(ri);
      }
    }
  }

  return ret;
}

set<CallInst *> tesla::CallsTo(Function *callee, Function *caller) {
  set<CallInst *> ret;

  for (auto &BB : *caller) {
    for (auto &I : BB) {
      if (auto ci = dyn_cast<CallInst>(&I)) {
        if (ci->getCalledFunction() == callee) {
          ret.insert(ci);
        }
      }
    }
  }

  return ret;
}
