#include "ReachabilityGraph.h"

#include <llvm/IR/Instructions.h>

ReachabilityGraph::ReachabilityGraph(Function &F) : Func(F) {
  for(auto &BB : Func) {
    vector<BasicBlock *> successors;
    auto term = BB.getTerminator();

    for(unsigned i = 0; i < term->getNumSuccessors(); i++) {
      successors.push_back(term->getSuccessor(i));
    }

    adjacency[&BB] = successors;
  }
}
