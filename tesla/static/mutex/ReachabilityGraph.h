#ifndef REACHABILITY_GRAPH_H
#define REACHABILITY_GRAPH_H

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>

#include <map>
#include <vector>

using std::map;
using std::vector;
using namespace llvm;

struct ReachabilityGraph {
  ReachabilityGraph(Function &F);

  bool Reachable(BasicBlock *start, BasicBlock *end);
private:
  map<BasicBlock *, vector<BasicBlock *>> adjacency; 
  Function &Func;
};

#endif
