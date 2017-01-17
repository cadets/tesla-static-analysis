#include "AcquireReleaseCheck.h"

AcquireReleaseCheck::AcquireReleaseCheck() : ModulePass(ID) {
}

void AcquireReleaseCheck::getAnalysisUsage(AnalysisUsage &AU) const {
}

bool AcquireReleaseCheck::runOnModule(Module &M) {
  errs() << "Running AcqRel check on a module\n";
  return true;
}
  
void AcquireReleaseCheck::print(raw_ostream &OS, const Module *m) const {
}

char AcquireReleaseCheck::ID = 0;
