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
#include <set>
#include <sstream>
#include <vector>

using std::set;
using std::string;
using namespace llvm;

struct Event;
struct EventRange;

struct EventGraph {
  friend struct Event;

  EventGraph() {}

  void replace(Event *from, Event *to);
  void replace(Event *from, EventRange *to);

  static EventGraph *BasicBlockGraph(Function *f);
  static EventGraph *InstructionGraph(Function *f);

  string GraphViz() const;
private:
  set<Event *> Events;
};

struct Event {
  friend struct EventGraph;
  friend struct EventRange;

  static Event *Create(Instruction *I);

  virtual string Name() const = 0;
  virtual string GraphViz() const;

protected:
  Event(EventGraph *g);

private:
  set<Event *> successors;
  EventGraph *const Graph;
};

struct InstructionEvent : public Event {
  InstructionEvent(EventGraph *g, Instruction *I)
    : Event(g), Instr(I) {}

  virtual string Name() const override;
private:
    Instruction *Instr;
};

struct EmptyEvent : public Event {
  EmptyEvent(EventGraph *g) : Event(g) {}
  virtual string Name() const override;
};

struct BasicBlockEvent : public Event {
  BasicBlockEvent(EventGraph *g, BasicBlock *bb)
    : Event(g), Block(bb) {}

  virtual string Name() const override {
    std::stringstream ss;
    ss << Block->getName().str() << ":" << Block;
    return ss.str();
  }
private:
  BasicBlock *Block;
};

struct EventRange {
  EventRange(Event *b, Event *e);

  static EventRange *Create(EventGraph *g, BasicBlock *bb);

  Event *const begin;
  Event *const end;
};

#endif
