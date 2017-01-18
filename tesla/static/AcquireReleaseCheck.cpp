#include "AcquireReleaseCheck.h"
#include "ControlPath.h"

AcquireReleaseCheck::AcquireReleaseCheck(const tesla::Automaton &A, 
                                         std::vector<tesla::Argument> args_) : 
  ModulePass(ID), 
  correctUsage(false),
  boundName(A.Use()->beginning().function().function().name()),
  automaton(A),
  args(args_)
{
}

void AcquireReleaseCheck::getAnalysisUsage(AnalysisUsage &AU) const {
}

bool AcquireReleaseCheck::runOnModule(Module &M) {
  auto BoundFn = M.getFunction(boundName);
  if(!BoundFn) {
    errs() << "Bounding function " << boundName
           << " does not exist in this module.\n";
    return false;
  }

  BasicBlock &entry = BoundFn->getEntryBlock();
  Instruction *first = entry.getFirstNonPHIOrDbgOrLifetime();
  IRBuilder<> B(first);

  std::vector<Value *> Args(tesla::CollectArgs(first, args, M, B));
  
  /**
   * For now, the automata being analysed should only have a single parameter
   * (the lock structure in question).
   */
  if(Args.size() != 1) {
    errs() << "Automata has more than one parameter\n";
    return true;
  }

  Value *lock = Args[0];
  auto calledFunctions = tesla::CalledFunctions(BoundFn);
  if(auto other = UsesOtherLock(lock, calledFunctions)) {
    errs() << "Use of another lock found - "
           << "this may lead to a runtime assertion failure.\n"
           << "Lock expected: "
           << lock->getName() << '\n'
           << "Lock used: "
           << other->getName() << '\n';
    return true;
  }

  return true;
}

Value *AcquireReleaseCheck::UsesOtherLock(Value *lock, std::set<Function *> calls) {
  for(auto f : calls) {
    auto acquire = f->getParent()->getFunction("lock_acquire");
    auto release = f->getParent()->getFunction("lock_release");

    for(auto &BB : *f) {
      for(auto &I : BB) {
        if(isa<CallInst>(I)) {
          auto &call = cast<CallInst>(I);
          if(call.getCalledFunction() == acquire || call.getCalledFunction() == release) {
            if(call.getArgOperand(0) != lock) {
              return call.getArgOperand(0);
            }
          }
        }
      }
    }
  }

  return nullptr;
}
  
void AcquireReleaseCheck::print(raw_ostream &OS, const Module *m) const {
  OS << "[AcqRel] correct usage: " << correctUsage << '\n';
}

const char *AcquireReleaseCheck::getPassName() const {
  return "AcquireReleaseCheck";
}

char AcquireReleaseCheck::ID = 0;
