#include "SimpleCallGraph.h"

#include <llvm/IR/Instructions.h>

#include <queue>
#include <set>

using std::queue;
using std::set;

SimpleCallGraph::SimpleCallGraph(Module &M) {
  for(auto &F : M) {
    Adjacency[&F] = getAdjacency(F);
  }
}

vector<Function *> SimpleCallGraph::TransitiveCalls(Function *root) {
  queue<Function *> toVisit{};
  set<Function *> found{};

  toVisit.push(root);

  while(!toVisit.empty()) {
    auto fn = toVisit.front();

    for(auto called : Calls(fn)) {
      if(std::find(found.begin(), found.end(), called) == found.end()) {
        found.insert(called); 
        toVisit.push(called);
      }
    }
  }

  vector<Function *>ret{};
  std::copy(found.begin(), found.end(), ret.begin());

  return ret;
}

vector<Function *> SimpleCallGraph::getAdjacency(Function &f) {
  vector<Function *> called{};

  for(auto &BB : f) {
    for(auto &I : BB) {
      if(isa<CallInst>(I)) {
        auto &call = cast<CallInst>(I);
        called.push_back(call.getCalledFunction());
      }
    }
  }

  return called;
}
