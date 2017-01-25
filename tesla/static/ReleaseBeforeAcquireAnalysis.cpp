#include "ReleaseBeforeAcquireAnalysis.h"
#include "ControlPath.h"

#include <llvm/Analysis/Dominators.h>

/**
 * Returns true if there is *any* releases before an acquire.
 */
bool ReleaseBeforeAcquireAnalysis::run() {
  auto calls = tesla::CalledFunctions(&Bound);
  calls.insert(&Bound);

  return std::any_of(calls.begin(), calls.end(),
    [=](Function *f) {
      return runOnFunction(f);
    }
  );
}

bool ReleaseBeforeAcquireAnalysis::runOnFunction(Function *F) {
  DominatorTree DT;
  DT.runOnFunction(*F);
  return true;
}
