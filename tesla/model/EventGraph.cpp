#include "EventGraph.h"

EventGraph::EventGraph(Function *b) {
}

EventGraph::EventGraph(BasicBlock *bb) {
  RootNode = nullptr;

  auto tail = RootNode;
  for(auto &I : *bb) {
    if(auto call = dyn_cast<CallInst>(&I)) {
      if(call->getCalledFunction()->isDeclaration()) { continue; }

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

string EventNode::GraphViz() const {
  stringstream ss;
  ss << name() << ";\n";
  for(auto n : neighbours) {
    ss << name() << " -> " << n->name() << ";\n";
  }
  return ss.str();
}

string EventGraph::GraphViz() const {
  stringstream ss;
  ss << "digraph {\n";

  queue<EventNode *> q;
  q.push(RootNode);
  while(!q.empty()) {
    auto node = q.front();
    q.pop();
    ss << node->GraphViz();
    for(auto n : node->neighbours) {
      q.push(n);
    }
  }

  ss << "}\n";
  return ss.str();
}
