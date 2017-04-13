#include "Arguments.h"

#include "GraphTransforms.h"

Event *GraphTransforms::FindAssertions::operator()(Event *e) {
  if(isa<EntryEvent>(e) || isa<ExitEvent>(e)) {
    return e;
  }

  auto ie = cast<InstructionEvent>(e);
  if(auto ci = dyn_cast<CallInst>(ie->Instr())) {
    if(ci->getCalledFunction() == Assertion) {
      auto loc = new tesla::Location;
      tesla::ParseAssertionLocation(loc, ci);

      return new AssertEvent(loc);
    }
  }

  return e;
}

Event *GraphTransforms::CallsOnly(Event *e) {
  if(auto ie = dyn_cast<InstructionEvent>(e)) {
    if(auto ci = dyn_cast<CallInst>(ie->Instr())) {
      auto called = ci->getCalledFunction();
      if(called && !called->isDeclaration()) {
        return new CallEvent(ci);
      }

      if(auto cst = dyn_cast<ConstantExpr>(ci->getOperand(0))) {
        if(cst->isCast()) {
          return new CallEvent(ci);
        }
      }
    }

    return new EmptyEvent;
  }

  if(isa<EntryEvent>(e) || isa<ExitEvent>(e) || isa<AssertEvent>(e)) {
    return e;
  }

  assert(false && "Non instruction event in calls only transform");
  __builtin_unreachable();
}

Event *GraphTransforms::DeleteCalls(Event *e) {
  if(isa<CallEvent>(e)) {
    return new EmptyEvent;
  }

  return e;
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

Event *GraphTransforms::DeleteEntryExit(Event *e) {
  if(isa<EntryEvent>(e) || isa<ExitEvent>(e)) {
    return new EmptyEvent;
  }

  return e;
}
