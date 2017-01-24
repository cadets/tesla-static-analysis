#include "ControlPath.h"
#include "OtherLockAnalysis.h"

OtherLockAnalysis::OtherLockAnalysis(Module &M, Function &F, Value &V) 
  : Analysis(M), Bound(F), Lock(V)
{
}

Value *OtherLockAnalysis::UsesOtherLock(std::set<Function *> calls) const {
  for(auto f : calls) {
    auto acquire = f->getParent()->getFunction("lock_acquire");
    auto release = f->getParent()->getFunction("lock_release");

    for(auto &BB : *f) {
      for(auto &I : BB) {
        if(isa<CallInst>(I)) {
          auto &call = cast<CallInst>(I);
          if(call.getCalledFunction() == acquire || call.getCalledFunction() == release) {
            if(call.getArgOperand(0) != &Lock) {
              return call.getArgOperand(0);
            }
          }
        }
      }
    }
  }

  return nullptr;
}

bool OtherLockAnalysis::run() {
  auto calledFunctions = tesla::CalledFunctions(&Bound);
  if(auto other = UsesOtherLock(calledFunctions)) {
    AddMessage("Use of another lock found - "
               "this may lead to a runtime assertion failure.\n");
    AddMessage("Lock expected: " + Lock.getName().str() + "\n");
    AddMessage("Lock used: " + other->getName().str() + "\n");
    return true;
  }

  return false;
}

std::string OtherLockAnalysis::AnalysisName() const {
  return "OtherLockAnalysis";
}
