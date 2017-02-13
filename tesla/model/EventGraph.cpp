#include "EventGraph.h"

EventGraph::EventGraph(Function *b) {
}

EventGraph::EventGraph(BasicBlock *bb) {
  RootNode = nullptr;

  auto tail = RootNode;
  for(auto &I : *bb) {
    if(auto call = dyn_cast<CallInst>(&I)) {
      auto node = new CallNode(call);

      if(!tail) {
        RootNode = node;
        tail = node;
      } else {
        tail->addNeighbour(node);
        tail = node;
      }
    }
  }

  ExitNode = tail;
}
