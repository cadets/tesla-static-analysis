#include "CallsFunctionOnce.h"
#include "ReachabilityGraph.h"
#include "SimpleCallGraph.h"

#include <llvm/Analysis/Dominators.h>

bool tesla::CallsFunctionOnce(Function *callee, Function *caller) {
  auto exits = FunctionExits(caller);
  auto calls = CallsTo(callee, caller);
  if (!ExitsDominated(caller, exits, calls)) {
    return false;
  }

  if (TransitiveCallsTo(callee, caller)) {
    return false;
  }

  return true;
}

bool tesla::TransitiveCallsTo(Function *callee, Function *caller) {
  SimpleCallGraph CG{*caller->getParent()};
  for (auto directCall : CG.Calls(caller)) {
    auto tCalls = CG.TransitiveCalls(directCall);

    if (std::find(tCalls.begin(), tCalls.end(), callee) != tCalls.end()) {
      return true;
    }
  }

  return false;
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

        if (CallsReachable(call, calls)) {
          return false;
        }
      }
    }

    if (dominanceCount != 1) {
      return false;
    }
  }

  return true;
}

bool tesla::CallsReachable(CallInst *call, set<CallInst *> others) {
  ReachabilityGraph RG{*call->getParent()->getParent()};

  for (auto other : others) {
    if (call != other && RG.Reachable(call->getParent(), other->getParent())) {
    }
  }

  return false;
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
