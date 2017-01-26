#include "SimpleCallGraph.h"

#include <llvm/IR/Instructions.h>

SimpleCallGraph::SimpleCallGraph(Module &M) {
  for(auto &F : M) {
    Adjacency[&F] = getAdjacency(&F);
  }
}

vector<Function *> SimpleCallGraph::getAdjacency(Function *f) {
  vector<Function *> called{};

  for(auto &BB : *f) {
    for(auto &I : BB) {
      if(isa<CallInst>(I)) {
        auto &call = cast<CallInst>(I);
        called.push_back(call.getCalledFunction());
      }
    }
  }

  return called;
}
