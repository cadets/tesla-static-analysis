/** @file */

#ifndef EVENT_GRAPH_H
#define EVENT_GRAPH_H

#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/Casting.h>
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

/**
 * Represents a single node in an event graph.
 *
 * This is a polymorphic class that is subclassed by implementations to provide
 * different types of events.
 */
struct EventNode {
  enum EventNodeKind {
    ENK_Call,
    ENK_Entry,
    ENK_Exit,
    ENK_Empty
  };

  /**
   * Events may have an LLVM value associated with them (e.g. a function call).
   */
  virtual Value *value() const = 0;

  /**
   * Events provide a name so that they can be printed to a graphviz
   * representation.
   */
  virtual string name() const = 0;

  /**
   * Stores the immediately accessible neighbours of this node (i.e. if this
   * node A has another node X in the vector, then there is an edge A -> X).
   * This supports cycles, self-edges and multiple edges.
   */
  vector<EventNode *> neighbours;

  /**
   * Convenience wrapper to add a neighbour to this node.
   */
  void addNeighbour(EventNode *n) { neighbours.push_back(n); }

  /**
   * A string that can be placed inside a graphviz graph to describe this node.
   */
  virtual string GraphViz() const;

private:
  const EventNodeKind Kind;
public:
  EventNode(EventNodeKind K) : Kind(K) {}
  EventNodeKind getKind() const { return Kind; }
};

/**
 * Node subclass representing a function call event.
 */
struct CallNode : public EventNode {
  CallNode(CallInst *c) : EventNode(ENK_Call), call(c) {}

  Value *value() const override { return call; }

  string name() const override { return call->getCalledFunction()->getName().str(); }

  static bool classof(const EventNode *E) {
    return E->getKind() == ENK_Call;
  }

private:
  CallInst *call;
};

/**
 * Placeholder node that will be removed by simplification.
 */
struct EmptyNode : public EventNode {
  EmptyNode() : EventNode(ENK_Empty) {}

  Value *value() const override { return nullptr; }
  string name() const override {
    stringstream ss;
    ss << "\"" << this << "\"";
    return ss.str();
  }

  static bool classof(const EventNode *E) {
    return E->getKind() == ENK_Empty;
  }
};

/**
 * Event representing entry to a function.
 */
struct FuncEntryNode : public EventNode {
  FuncEntryNode(Function *f) : EventNode(ENK_Entry), Fn(f) {}

  Value *value() const override { return Fn; }

  string name() const override {
    return "\"entry:" + Fn->getName().str() + "\"";
  }

  static bool classof(const EventNode *E) {
    return E->getKind() == ENK_Entry;
  }
private:
  Function *Fn;
};

/**
 * Event representing exit from a function.
 *
 * Corresponds to return and unreachable instructions currently.
 */
struct FuncExitNode : public EventNode {
  FuncExitNode(Function *f) : EventNode(ENK_Exit), Fn(f) {}
  Value *value() const override { return Fn; }

  string name() const override {
    return "\"exit:" + Fn->getName().str() + "\"";
  }

  static bool classof(const EventNode *E) {
    return E->getKind() == ENK_Exit;
  }
private:
  Function *Fn;
};

/**
 * Wrapper class respresenting a whole graph.
 */
struct EventGraph {
  friend struct EventNode;

  /**
   * Construct an event graph for a whole module.
   */
  EventGraph(Module *m);

  /**
   * Construct the event graph for a single function.
   */
  EventGraph(Function *b);

  /**
   * Construct the event graph for a single basic block.
   */
  EventGraph(BasicBlock *bb);

  /**
   * Get the event graph for a basic block out of a cache if possible, or
   * construct one if not.
   */
  static EventGraph *BBCachedCreate(map<BasicBlock *, EventGraph *> &c, BasicBlock *bb);

  /**
   * Apply all possible simplifications to this graph.
   */
  void Simplify();

  /**
   * Eliminate empty nodes from this graph, while preserving transitive edges.
   */
  void SimplifyEmptyNodes();

  /**
   * Eliminate duplicate edges between nodes in the graph.
   */
  void SimplifyDuplicates();

  /**
   * Generates a graphviz subgraph description of this graph that can be
   * embedded in a digraph.
   */
  string GraphViz() const;

private:
  map<Function *, EventGraph *> funcCache;
  map<BasicBlock *, EventGraph *> bbCache;
  EventNode *RootNode;
  EventNode *ExitNode;
};

#endif
