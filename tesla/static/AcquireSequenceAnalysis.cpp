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

set<BranchLoc> AcquireSequenceAnalysis::trace(BinaryOperator *bop, BoolFactory e) {
  // We've only seen XOR in the wild so far - can handle others later.
  if(bop->getOpcode() != Instruction::Xor) {
    return {};
  }

  auto lc = dyn_cast<Constant>(bop->getOperand(0));
  auto rc = dyn_cast<Constant>(bop->getOperand(1));
  auto c = lc ? lc : rc;
  if(!c) {
    return {};
  }

  set<BranchLoc> locs;
  for(auto it = bop->use_begin(); it != bop->use_end(); it++) {
    auto newE = [=]{
      return c->getUniqueInteger().getBoolValue() ^ e();
    };
    auto useLocs = trace(*it, newE);
    
    for(auto l : useLocs) {
      locs.insert(l);
    }
  }

  return locs;
}

set<BranchLoc> AcquireSequenceAnalysis::trace(Value *usage, BoolFactory e) {
  set<BranchLoc> locs;
  // for each usage, check if it's a branch. If so, make a BranchLoc with the
  // branch and e, then put it in the set. For each other, if it's a constant
  // boolean expr (i.e. ^ true), then modify e and call recursively. If it's
  // anything else, don't recurse.

  if(auto br = dyn_cast<BranchInst>(usage)) {
    locs.insert({br, e});
  }

  for(auto it = usage->use_begin(); it != usage->use_end(); it++) {
    if(auto bop = dyn_cast<BinaryOperator>(*it)) {
      auto recLocs = trace(bop, e);

      for(auto l : recLocs) {
        locs.insert(l);
      }
    }
  }

  return locs;
}

set<BranchLoc> AcquireSequenceAnalysis::trace(Value *usage) {
  return trace(usage, []{ return true; });
}
