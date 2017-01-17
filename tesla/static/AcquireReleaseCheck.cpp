#include "AcquireReleaseCheck.h"

AcquireReleaseCheck::AcquireReleaseCheck(string bound) : 
  ModulePass(ID), 
  correctUsage(false),
  boundName(bound) {}

void AcquireReleaseCheck::getAnalysisUsage(AnalysisUsage &AU) const {
}

bool AcquireReleaseCheck::runOnModule(Module &M) {
  return true;
}
  
void AcquireReleaseCheck::print(raw_ostream &OS, const Module *m) const {
  OS << "[AcqRel] correct usage: " << correctUsage << '\n';
}

char AcquireReleaseCheck::ID = 0;
