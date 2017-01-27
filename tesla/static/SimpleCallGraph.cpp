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

bool SimpleCallGraph::shouldInclude(Function *f) {
  return f && !f->isDeclaration();
}

vector<Function *> SimpleCallGraph::TransitiveCalls(Function *root) {
  queue<Function *> toVisit{};
  set<Function *> found{};

  toVisit.push(root);

  while(!toVisit.empty()) {
    auto fn = toVisit.front();
    toVisit.pop();

    for(auto called : Calls(fn)) {
      if(shouldInclude(called)) {
        if(std::find(found.begin(), found.end(), called) == found.end()) {
          found.insert(called); 
          toVisit.push(called);
        }
      }
    }
  }

  vector<Function *>ret{};
  ret.assign(found.begin(), found.end());

  return ret;
}

vector<Function *> SimpleCallGraph::getAdjacency(Function &f) {
  set<Function *> called{};

  for(auto &BB : f) {
    for(auto &I : BB) {
      if(isa<CallInst>(I)) {
        auto &call = cast<CallInst>(I);
        auto calledFn = call.getCalledFunction();
        if(shouldInclude(calledFn)) {
          called.insert(calledFn);
        }
      }
    }
  }

  vector<Function *> ret{};
  ret.assign(called.begin(), called.end());
  return ret;
}
