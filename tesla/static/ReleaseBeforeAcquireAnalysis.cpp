#include "ControlPath.h"
#include "Debug.h"
#include "ReleaseBeforeAcquireAnalysis.h"

#include <llvm/Analysis/Dominators.h>
#include <llvm/IR/Instructions.h>

/**
 * Returns true if there is *any* releases before an acquire.
 */
bool ReleaseBeforeAcquireAnalysis::run() {
  auto calls = tesla::CalledFunctions(&Bound);
  calls.insert(&Bound);

  return std::any_of(calls.begin(), calls.end(),
    [=](Function *f) {
      return runOnFunction(f);
    }
  );
}

bool ReleaseBeforeAcquireAnalysis::runOnFunction(Function *F) {
  DominatorTree DT;
  DT.runOnFunction(*F);

  auto acqFn = Mod.getFunction("lock_acquire");
  auto relFn = Mod.getFunction("lock_release");

  std::set<CallInst *> acqs;
  std::set<CallInst *> rels;
  for(auto &BB : *F) {
    for(auto &I : BB) {
      if(isa<CallInst>(I)) {
        auto &call = cast<CallInst>(I);
        if(call.getArgOperand(0) != &Lock) {
          continue;
        }

        if(call.getCalledFunction() == acqFn) {
          acqs.insert(&call);
        }

        if(call.getCalledFunction() == relFn) {
          rels.insert(&call);
        }
      }
    }
  }

  for(auto release : rels) {
    for(auto acquire : acqs) {
      if(DT.dominates(release, acquire)) {
        AddMessage("Found a release call dominating an acquire call:");
        AddMessage("Release call: " + tesla::DebugLocationString(release));
        AddMessage("Acquire call: " + tesla::DebugLocationString(acquire));
        return true;
      }
    }
  }

  return false;
}
