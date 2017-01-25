#ifndef RELEASE_BEFORE_ACQUIRE_H
#define RELEASE_BEFORE_ACQUIRE_H

#include "Analysis.h"

#include <string>

struct ReleaseBeforeAcquireAnalysis : public Analysis {
  ReleaseBeforeAcquireAnalysis(Module &M, Function &F, Value &V) : 
    Analysis(M), Bound(F), Lock(V) {}

  bool run() override;
  std::string AnalysisName() const override { return "ReleaseBeforeAcquireAnalysis"; } 

private:
  bool runOnFunction(Function *F);
  Function &Bound;
  Value &Lock;
};

#endif
