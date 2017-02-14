#include "EventGraph.h"

#include <map>

using std::map;

Event::Event(EventKind k, EventGraph *g) 
  : Graph(g), Kind(k)
{
  g->Events.insert(this);
}

EventGraph *EventGraph::BasicBlockGraph(Function *f) {
  auto eg = new EventGraph;

  map<BasicBlock *, Event *> cache;

  for(auto &BB : *f) {
    if(cache.find(&BB) == cache.end()) {
      cache[&BB] = new BasicBlockEvent(eg, &BB);
    }

    auto term = BB.getTerminator();
    for(int i = 0; i < term->getNumSuccessors(); i++) {
      auto suc = term->getSuccessor(i);
      if(cache.find(suc) == cache.end()) {
        cache[suc] = new BasicBlockEvent(eg, suc);
      }

      cache[&BB]->successors.insert(cache[suc]);
    }
  }

  return eg;
}

EventGraph *EventGraph::InstructionGraph(Function *f) {
  auto eg = BasicBlockGraph(f);

  set<BasicBlockEvent *> toRemove;
  for(auto ev : eg->Events) {
    if(auto bbe = dyn_cast<BasicBlockEvent>(ev)) {
      toRemove.insert(bbe);
    }
  }

  for(auto bbe : toRemove) {
    auto range = EventRange::Create(eg, bbe->Block);
    eg->replace(bbe, range);
  }
  
  return eg;
}

void EventGraph::replace(Event *from, Event *to) {
  assert(from->Graph == to->Graph && "Can't replace between graphs!");

  replace(from, new EventRange(to, to));
}

void EventGraph::replace(Event *from, EventRange *to) {
  assert(from->Graph == to->begin->Graph && "Can't replace between graphs!");
  for(auto ev : Events) {
    if(ev->successors.find(from) != ev->successors.end()) {
      ev->successors.erase(from);
      ev->successors.insert(to->begin);
    }
  }

  Events.erase(from);

  for(auto suc : from->successors) {
    to->end->successors.insert(suc);
  }
}

EventRange *EventRange::Create(EventGraph *g, BasicBlock *bb) {
  Event *head = nullptr;
  Event *tail = nullptr;

  for(auto &I : *bb) {
    auto next = new InstructionEvent(g, &I);
    
    if(!head) {
      head = next;
      tail = head;
    } else {
      tail->successors.insert(next);
      tail = next;
    }
  }

  return new EventRange{head, tail};
}

string EventGraph::GraphViz() const {
  std::stringstream ss;

  ss << "digraph {\n";
  for(auto ev : Events) {
    ss << "\"" << ev->GraphViz() << "\"" << '\n';
    for(auto suc : ev->successors) {
      ss << "\"" << ev->GraphViz() << "\" -> \""
         << suc->GraphViz() << "\";\n";
    }
  }
  ss << "}\n";

  return ss.str();
}

string Event::GraphViz() const {
  return Name();
}

string EmptyEvent::Name() const {
  std::stringstream ss;
  ss << "empty:" << this;
  return ss.str();
}

string InstructionEvent::Name() const {
  string s;
  raw_string_ostream ss(s);
  Instr->print(ss);
  return ss.str();
}

EventRange::EventRange(Event *b, Event *e)
  : begin(b), end(e)
{
  assert(b && e && "Range event is nullptr");
  assert(b->Graph == e->Graph && "Range from different graphs!");
}
