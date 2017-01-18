#include "AcquireReleaseCheck.h"

AcquireReleaseCheck::AcquireReleaseCheck(const tesla::Automaton &A) : 
  ModulePass(ID), 
  correctUsage(false),
  boundName(A.Use()->beginning().function().function().name()),
  automaton(A)
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

  std::vector<Value *> args(tesla::CollectArgs(first, automaton, M, B));

  return true;
}
  
void AcquireReleaseCheck::print(raw_ostream &OS, const Module *m) const {
  OS << "[AcqRel] correct usage: " << correctUsage << '\n';
}

char AcquireReleaseCheck::ID = 0;
