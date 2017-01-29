#include "ReachabilityGraph.h"

#include <llvm/IR/Instructions.h>

#include <set>
#include <stack>

using std::set;
using std::stack;

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

bool ReachabilityGraph::Reachable(BasicBlock *start, BasicBlock *end) {
  if(start == end) {
    return true;
  }

  set<BasicBlock *> visited;
  stack<BasicBlock *> st;

  for(auto succ : adjacency[start]) {
    st.push(succ);
  }

  while(!st.empty()) {
    auto next = st.top();
    st.pop();

    if(next == end) {
      return true;
    }

    for(auto succ : adjacency[next]) {
      if(std::find(visited.begin(), visited.end(), succ) == visited.end()) {
        st.push(succ);
      }
    }

    visited.insert(next);
  }

  return false;
}
