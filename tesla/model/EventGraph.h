#ifndef EVENT_GRAPH_H
#define EVENT_GRAPH_H

#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/raw_ostream.h>

#include <map>
#include <queue>
#include <sstream>
#include <vector>

using std::map;
using std::string;
using std::stringstream;
using std::queue;
using std::vector;
using namespace llvm;

struct EventNode {
  virtual Value *value() const = 0;
  virtual string name() const = 0;
  vector<EventNode *> neighbours;

  void addNeighbour(EventNode *n) { neighbours.push_back(n); }

  bool operator==(const EventNode &other) const {
    return value() == other.value();
  }

  string GraphViz() const {
    stringstream ss;
    ss << name() << '\n';
    for(auto n : neighbours) {
      ss << name() << " -> " << n->name() << '\n';
    }
    return ss.str();
  }
};

struct CallNode : public EventNode {
  CallNode(CallInst *c) : call(c) {}

  Value *value() const override { return call; }
  string name() const override { return call->getCalledFunction()->getName().str(); }
private:
  CallInst *call;
};

struct EventGraph {
  EventGraph(Function *b);
  EventGraph(BasicBlock *bb);

  const EventNode& Root() const { return *RootNode; }
  const EventNode& Exit() const { return *ExitNode; }
  bool Empty() const { return !RootNode; }

  string GraphViz() const {
    stringstream ss;

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

    return ss.str();
  }
private:
  map<Function *, EventGraph *> funcCache;
  map<BasicBlock *, EventGraph *> bbCache;
  EventNode *RootNode;
  EventNode *ExitNode;
};

#endif
