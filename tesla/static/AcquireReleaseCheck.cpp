#include "AcquireReleaseCheck.h"

AcquireReleaseCheck::AcquireReleaseCheck() : ModulePass(ID) {
}

void AcquireReleaseCheck::getAnalysisUsage(AnalysisUsage &AU) const {
}

bool AcquireReleaseCheck::runOnModule(Module &M) {
  return true;
}
  
void AcquireReleaseCheck::print(raw_ostream &OS, const Module *m) const {
}

char AcquireReleaseCheck::ID = 0;
