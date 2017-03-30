#include "EventGraph.h"
#include "GraphTransforms.h"

#include <llvm/Support/CFG.h>

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
  auto eg = new EventGraph(f->getName().str());

  auto infs = Condition::StrongestInferences(f);

  map<BasicBlock *, Event *> cache;

  for(auto &BB : *f) {
    // In this case the basic block is statically unreachable so we don't emit
    // an event for it.
    if(pred_begin(&BB) == pred_end(&BB) && 
       &BB != &f->getEntryBlock()) { continue; }

    if(cache.find(&BB) == cache.end()) {
      cache[&BB] = new BasicBlockEvent(eg, &BB, infs[&BB]);
    }

    auto term = BB.getTerminator();
    for(int i = 0; i < term->getNumSuccessors(); i++) {
      auto suc = term->getSuccessor(i);
      if(cache.find(suc) == cache.end()) {
        cache[suc] = new BasicBlockEvent(eg, suc, infs[suc]);
      }

      cache[&BB]->successors.insert(cache[suc]);
    }
  }

  return eg;
}

EventRange *EventGraph::Expand(BasicBlockEvent *e, int depth, map<Function *, EventGraph *> &cache)
{
  if(depth == 0) {
    return new EventRange{e, e};
  }

  EventRange *range = nullptr;
  for(auto& I : *e->Block) {
    if(auto ci = dyn_cast<CallInst>(&I)) {
      if(ci->getCalledFunction()->isDeclaration()) {
        continue;
      }

      auto gr = ExpandedBasicBlockGraph(ci->getCalledFunction(), depth, cache);
      auto rr = gr->ReleasedRange();

      if(!range) {
        range = rr;
      } else {
        range->end->addSuccessor(rr->begin);
        range = new EventRange{range->begin, rr->end};
      }
    }
  }

  if(!range) {
    return new EventRange{e, e};
  }

  auto begin = e;
  auto end = e;

  begin->addSuccessor(range->begin);
  range->end->addSuccessor(end);

  return new EventRange{begin, end};
}

EventGraph *EventGraph::ExpandedBasicBlockGraph(Function *f, int depth) {
  auto cache = map<Function *, EventGraph *>{};
  return ExpandedBasicBlockGraph(f, depth, cache);
}

EventGraph *EventGraph::ExpandedBasicBlockGraph(Function *f, int depth, map<Function *, EventGraph *> &cache)
{
  auto bbg = BasicBlockGraph(f);

  auto ent = new EntryEvent(bbg, f);
  for(auto e : bbg->entries()) {
    if(e != ent) {
      ent->addSuccessor(e);
    }
  }

  auto ex = new ExitEvent(bbg, f);
  for(auto e : bbg->exits()) {
    if(e != ex) {
      e->addSuccessor(ex);
    }
  }

  set<BasicBlockEvent *> toReplace;
  for(auto ev : bbg->Events) {
    if(auto bb = dyn_cast<BasicBlockEvent>(ev)) {
      toReplace.insert(bb);
    }
  }

  for(auto bb : toReplace) {
    bbg->replace(bb, Expand(bb, depth-1, cache));
  }

  bbg->consolidate();
  bbg->assert_valid();
  return bbg;
}

EventGraph *EventGraph::InstructionGraph(Function *f, CallInst *ci) {
  if(ci) {
    assert(f == ci->getCalledFunction() && "Heading for inconsistency here");
  }

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

  auto ent = ci ? new EntryEvent(eg, ci) : new EntryEvent(eg, f);
  for(auto e : eg->entries()) {
    if(e != ent) {
      ent->addSuccessor(e);
    }
  }

  auto ex = ci ? new ExitEvent(eg, ci) : new ExitEvent(eg, f);
  for(auto e : eg->exits()) {
    if(e != ex) {
      e->addSuccessor(ex);
    }
  }
  
  return eg;
}

EventGraph *EventGraph::ModuleGraph(Module *M, Function *root, int depth) {
  auto assertFn = M->getFunction("__tesla_inline_assertion");

  EventGraph *eg = InstructionGraph(root);
  eg->transform(GraphTransforms::FindAssertions(assertFn));
  eg->transform(GraphTransforms::CallsOnly);

  for(int i = 0; i < depth; i++) {
    auto EventsCopy = eg->Events;
    for(auto ev : EventsCopy) {
      if(auto ce = dyn_cast<CallEvent>(ev)) {
        auto fn = ce->Call()->getCalledFunction();

        auto gr = InstructionGraph(fn, ce->Call());
        gr->transform(GraphTransforms::FindAssertions(assertFn));
        gr->transform(GraphTransforms::CallsOnly);

        auto rr = gr->ReleasedRange();
        eg->replace(ev, rr);

        std::stringstream ss;
        ss << ":" << rr;

        eg->transform(GraphTransforms::Tag(rr->begin, ss.str()));
        eg->transform(GraphTransforms::Tag(rr->end, ss.str()));
        continue;
      }

      if(isa<EntryEvent>(ev) || isa<ExitEvent>(ev) || isa<AssertEvent>(ev)) {
        continue;
      }

      assert(false && "Non call event in module graph!");
    }
  }

  eg->transform(GraphTransforms::DeleteCalls);
  return eg;
}

EventRange *EventGraph::ReleasedRange() {
  auto ents = entries();
  auto exs = exits();

  assert(ents.size() == 1 && "Can't get released range for multiple entries");
  assert(exs.size() == 1 && "Can't get released range for multiple exs");

  releaseAllEvents();
  return new EventRange{*ents.begin(), *exs.begin()}; 
}

set<Event *> EventGraph::entries() {
  map<Event *, int> counts;

  for(auto ev : Events) {
    for(auto suc : ev->successors) {
      if(counts.find(suc) == counts.end()) {
        counts[suc] = 0;
      }

      if(ev != suc) {
        counts[suc]++;
      }
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
    if(ev->successors.size() == 0 ||
       (ev->successors.size() == 1 && ev->successors.find(ev) != ev->successors.end()))
    {
      exits.insert(ev);
    }
  }

  return exits;
}

void EventGraph::releaseAllEvents() {
  for(auto ev : Events) {
    ev->Graph = nullptr;
  }
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
  replace(from, new EventRange(to, to));

  assert_valid();
}

void EventGraph::replace(Event *from, EventRange *to) {
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

  for(auto ev : to->Events) {
    ev->Register(from->Graph);
    Events.insert(ev);
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

  ss << "digraph " << Name << " {\n";
  ss << "  " << GraphVizStyle() << '\n';

  for(auto ev : Events) {
    ss << "  \"" << ev->GraphViz() << "\"" << '\n';
    for(auto suc : ev->successors) {
      ss << "  \"" << ev->GraphViz() << "\" -> \""
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

  queue<Event *> visits;
  visits.push(b);

  while(!visits.empty()) {
    auto ev = visits.front();
    visits.pop();

    if(Events.find(ev) == Events.end()) {
      Events.insert(ev);
    } else {
      continue;
    }

    for(auto suc : ev->successors) {
      visits.push(suc);
    }
  }
}
