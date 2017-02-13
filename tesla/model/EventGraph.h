#ifndef EVENT_GRAPH_H
#define EVENT_GRAPH_H

#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Value.h>

#include <vector>

using std::vector;
using namespace llvm;

struct EventNode {
  EventNode(vector<EventNode *> ns) :
    neighbours(ns) {}

  virtual Value *value() const = 0;
  const vector<EventNode *> neighbours;
};

struct CallNode : public EventNode {
  CallNode(vector<EventNode *> ns, CallInst *c) :
    EventNode(ns), call(c) {}

  Value *value() const override { return call; }
private:
  CallInst *call;
};

struct EventGraph {
  EventGraph(Function *b) :
    Bound(b) {}

private:
  Function *Bound;
};

#endif
