#include <set>

#include "EventGraph.h"

using std::set;

EventGraph *EventGraph::get(Function *root) {
  static map<Function *, EventGraph *> fCache;
  static map<BasicBlock *, EventGraph *> bbCache;
  
  auto ret = FCachedCreate(fCache, bbCache, root);
  ret->Simplify();

  return ret;
}

EventGraph::EventGraph(Function *b,
                       CallInst *c,
                       map<Function *, EventGraph *> fCache,
                       map<BasicBlock *, EventGraph *> bbCache)
{
  RootNode = new FuncEntryNode(c, b);
  ExitNode = new FuncExitNode(b);

  auto entry = &b->getEntryBlock();
  queue<BasicBlock *> blocks;
  set<BasicBlock *> visits;

  blocks.push(entry);
  
  while(!blocks.empty()) {
    auto bb = blocks.front();
    blocks.pop();

    if(visits.find(bb) == visits.end()) {
      visits.insert(bb);
    } else {
      continue;
    }

    auto gr = BBCachedCreate(fCache, bbCache, bb);
    if(RootNode->neighbours.empty()) {
      RootNode->addNeighbour(gr->RootNode);
    }

    auto term = bb->getTerminator();
    if(isa<ReturnInst>(term) || isa<UnreachableInst>(term)) {
      gr->ExitNode->addNeighbour(ExitNode);
    }

    for(auto i = 0; i < term->getNumSuccessors(); i++) {
      auto suc = term->getSuccessor(i);
      auto sucGr = BBCachedCreate(fCache, bbCache, suc);
      gr->ExitNode->addNeighbour(sucGr->RootNode);

      blocks.push(suc);
    }
  }
}

EventGraph::EventGraph(BasicBlock *bb, 
                       map<Function *, EventGraph *> fCache,
                       map<BasicBlock *, EventGraph *> bbCache)
{
  RootNode = nullptr;

  auto tail = RootNode;
  for(auto &I : *bb) {
    if(auto call = dyn_cast<CallInst>(&I)) {
      if(call->getCalledFunction()->isDeclaration()) { continue; }

      auto fGr = FCachedCreate(fCache, bbCache, call->getCalledFunction(), call);

      if(!tail) {
        RootNode = fGr->RootNode;
      } else {
        tail->addNeighbour(fGr->RootNode);
      }

      tail = fGr->ExitNode;
    }
  }

  ExitNode = tail;

  if(!RootNode) {
    RootNode = new EmptyNode;
    ExitNode = RootNode;
  }
}

void EventGraph::Simplify() {
  SimplifyEmptyNodes();
  SimplifyDuplicates();
}

void EventGraph::SimplifyDuplicates() {
  queue<EventNode *> q;
  set<EventNode *> visits;
  q.push(RootNode);

  while(!q.empty()) {
    auto node = q.front();
    q.pop();

    if(visits.find(node) == visits.end()) {
      visits.insert(node);
    } else {
      continue;
    }

    set<EventNode *> dedup;
    for(auto n : node->neighbours) {
      dedup.insert(n);
      q.push(n);
    }

    node->neighbours.clear();
    node->neighbours.insert(node->neighbours.begin(), dedup.begin(), dedup.end());
  }
}

void EventGraph::SimplifyEmptyNodes() {
  bool found;
  do {
    found = false;

    queue<EventNode *> q;
    set<EventNode *> visits;

    q.push(RootNode);

    while(!q.empty()) {
      auto node = q.front();
      q.pop();

      if(visits.find(node) == visits.end()) {
        visits.insert(node);
      } else {
        continue;
      }

      set<EventNode *> toErase;
      for(auto n : node->neighbours) {
        if(isa<EmptyNode>(n)) {
          for(auto en : n->neighbours) {
            node->addNeighbour(en);  
          }

          found = true;
          toErase.insert(n);
        }

        q.push(n);
      }

      node->neighbours.erase(std::remove_if(node->neighbours.begin(), node->neighbours.end(),
        [=](EventNode *e) {
          return toErase.find(e) != toErase.end();
        }
      ), node->neighbours.end());
    }
  } while(found);
}

EventGraph *EventGraph::FCachedCreate(
    map<Function *, EventGraph *> &c,
    map<BasicBlock *, EventGraph *> &bbc, Function *f, CallInst *call) 
{
  if(c.find(f) != c.end()) {
    return c[f];
  }

  EventGraph *ret;
  if(call) {
    ret = new EventGraph{call};
  } else {
    ret = new EventGraph{f};
  }

  c[f] = ret;
  return ret;
}

EventGraph *EventGraph::BBCachedCreate(
    map<Function *, EventGraph *> &fc,
    map<BasicBlock *, EventGraph *> &c, BasicBlock *bb) 
{
  if(c.find(bb) != c.end()) {
    return c[bb];
  }

  auto ret = new EventGraph{bb};
  c[bb] = ret;
  return ret;
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
  ss << "subgraph {\n";

  queue<EventNode *> q;
  set<EventNode *> visits;

  q.push(RootNode);
  while(!q.empty()) {
    auto node = q.front();
    q.pop();

    if(visits.find(node) == visits.end()) {
      visits.insert(node);
    } else {
      continue;
    }
    
    if(node) {
      ss << node->GraphViz();
      for(auto n : node->neighbours) {
        q.push(n);
      }
    }
  }

  ss << "}\n";
  return ss.str();
}
