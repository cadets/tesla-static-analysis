#include "AcquireReleaseCheck.h"

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

  return true;
}
  
void AcquireReleaseCheck::print(raw_ostream &OS, const Module *m) const {
  OS << "[AcqRel] correct usage: " << correctUsage << '\n';
}

char AcquireReleaseCheck::ID = 0;
