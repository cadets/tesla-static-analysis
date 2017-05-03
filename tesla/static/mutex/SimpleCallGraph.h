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

  /**
   * Return all the functions called directly by the parameter.
   */
  inline vector<Function *> Calls(Function *f) {
    return Adjacency[f];
  }

  /**
   * Return all the functions called (even transitively) by the parameter.
   */
  vector<Function *> TransitiveCalls(Function *f);
private:
  map<Function *, vector<Function *>> Adjacency;
  static bool shouldInclude(Function *f);
  static vector<Function *> getAdjacency(Function &f);
};

#endif
