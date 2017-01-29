#include "Debug.h"
#include "ReachabilityGraph.h"
#include "ReleaseDominanceAnalysis.h"

bool ReleaseDominanceAnalysis::run() {
  auto releases = ReleaseCalls();
  auto ret = true;

  for(auto &F : Mod) {
    ReachabilityGraph RG{F};

    auto localRels = releases[&F];
    for(auto callA : localRels) {
      for(auto callB : localRels) {
        if(callA != callB) {
          if(RG.Reachable(callA->getParent(), callB->getParent())) {
            AddMessage("Release call reachable from another release call");
            AddMessage("First call: " + tesla::DebugLocationString(callA));
            AddMessage("Second call: " + tesla::DebugLocationString(callB));
            ret = true;
          }
        }
      }
    }
  }

  return ret;
}

map<Function *, set<CallInst *>> ReleaseDominanceAnalysis::ReleaseCalls() {
  auto relFn = Mod.getFunction("lock_release");
  map<Function *, set<CallInst *>> map{};

  for(auto &F : Mod) {
    set<CallInst *> calls{};

    for(auto &BB : F) {
      for(auto &I : BB) {
        if(isa<CallInst>(I)) {
          auto &call = cast<CallInst>(I);
          if(call.getCalledFunction() == relFn) {
            calls.insert(&call);
          }
        }
      }
    }

    map[&F] = calls;
  }

  return map;
}
