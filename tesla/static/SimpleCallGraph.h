#ifndef SIMPLE_CALL_GRAPH_H
#define SIMPLE_CALL_GRAPH_H

#include <llvm/IR/Function.h>
#include <llvm/IR/Module.h>

#include <map>
#include <vector>

using std::map;
using std::vector;
using namespace llvm;

struct SimpleCallGraph {
  
  /**
   * Construct a call graph from the given module.
   */
  SimpleCallGraph(Module &M);

private:
  map<Function *, vector<Function *>> Adjacency;
  static vector<Function *> getAdjacency(Function *f);
};

#endif
