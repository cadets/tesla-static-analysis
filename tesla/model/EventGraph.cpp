#include "EventGraph.h"

#include <map>
#include <queue>
#include <set>

using std::map;
using std::queue;
using std::set;

Event::Event(EventKind k, EventGraph *g) 
  : Graph(g), Kind(k)
{
  if(g) {
    g->Events.insert(this);
  }
}

void EventGraph::assert_valid() {
  queue<Event *> q;
  set<Event *> visits;

  for(auto e : Events) {
    q.push(e);
  }

  while(!q.empty()) {
    auto e = q.front();
    q.pop();

    if(visits.find(e) == visits.end()) {
      visits.insert(e);
    } else {
      continue;
    }

    assert(e->Graph == this);

    for(auto suc : e->successors) {
      assert(Events.find(suc) != Events.end() &&
              "Successor not in graph!");
      q.push(suc);
    }
  }
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

set<Event *> EventGraph::entries() {
  map<Event *, int> counts;

  for(auto ev : Events) {
    for(auto suc : ev->successors) {
      if(counts.find(suc) == counts.end()) {
        counts[suc] = 0;
      }

      counts[suc]++;
    }
  }

  set<Event *> entries;
  for(auto ev : Events) {
    if(counts[ev] == 0) {
      entries.insert(ev);
    }
  }

  return entries;
}

set<Event *> EventGraph::exits() {
  set<Event *> exits;

  for(auto ev : Events) {
    if(ev->successors.size() == 0) {
      exits.insert(ev);
    }
  }

  return exits;
}

// Just a helper for now so it isn't declared in the class - might need to
// change in the future but it's OK at the moment.
Event *cachedTransform(map<Event *, Event *> &cache, Event *e, 
                       EventGraph::EventTransformation T) 
{
  if(cache.find(e) == cache.end()) {
    cache[e] = T(e);
  }

  return cache[e];
}

void EventGraph::transform(EventTransformation T) {
  set<Event *> newEvents;
  map<Event *, Event *> cache;

  for(auto ev : Events) {
    auto newEv = cachedTransform(cache, ev, T);
    newEv->successors = ev->successors;

    set<set<Event *>> toCheck = {Events, newEvents};
    std::for_each(toCheck.begin(), toCheck.end(), [&](set<Event *> evs) {
      for(auto other : evs) {
        if(other->successors.find(ev) != other->successors.end()) {
          other->successors.erase(ev);
          other->successors.insert(newEv);
        }
      }}
    );

    newEvents.insert(newEv);
  }

  Events.clear();

  for(auto newEv : newEvents) {
    newEv->Register(this);
  }

  Events = newEvents;

  consolidate();
  assert_valid();
}

void EventGraph::consolidate() {
  auto EventsCopy = Events;

  for(auto ev : EventsCopy) {
    if(isa<EmptyEvent>(ev)) {
      Events.erase(ev);

      for(auto other : EventsCopy) {
        if(other->successors.find(ev) != other->successors.end()) {
          other->successors.erase(ev);
          for(auto suc : ev->successors) {
            if(suc != ev) {
              other->successors.insert(suc);
            }
          }
        }
      }
    }
  }
}

void EventGraph::replace(Event *from, Event *to) {
  assert(from->Graph == to->Graph && "Can't replace between graphs!");

  replace(from, new EventRange(to, to));

  assert_valid();
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

  assert_valid();
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
  ss << "instruction:" << this;
  return ss.str();
}

string CallEvent::Name() const {
  std::stringstream ss;
  ss << "call:" << Call()->getCalledFunction()->getName().str() << ":" << this;
  return ss.str();
}

EventRange::EventRange(Event *b, Event *e)
  : begin(b), end(e)
{
  assert(b && e && "Range event is nullptr");
  assert(b->Graph == e->Graph && "Range from different graphs!");
}
