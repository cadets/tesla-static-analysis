#include "GraphTransforms.h"

Event *GraphTransforms::CallsOnly(Event *e) {
  if(auto ie = dyn_cast<InstructionEvent>(e)) {
    if(auto ci = dyn_cast<CallInst>(ie->Instr())) {
      if(!ci->getCalledFunction()->isDeclaration()) {
        return new CallEvent(ci);
      }
    }
    
    return new EmptyEvent;
  }

  if(isa<EntryEvent>(e) || isa<ExitEvent>(e)) {
    return e;
  }

  assert(false && "Non instruction event in calls only transform");
}

Event *GraphTransforms::Tag::operator()(Event *e) {
  if(e == ev) {
    if(auto en = dyn_cast<EntryEvent>(e)) {
      en->Description += str_;
    }

    if(auto ex = dyn_cast<ExitEvent>(e)) {
      ex->Description += str_;
    }
  }

  return e;
}
