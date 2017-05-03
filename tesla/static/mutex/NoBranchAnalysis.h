#ifndef NO_BRANCH_ANALYSIS_H
#define NO_BRANCH_ANALYSIS_H

#include "Analysis.h"

#include <llvm/IR/Instructions.h>

#include <set>

struct NoBranchAnalysis : public Analysis {
  NoBranchAnalysis(Module &M) : Analysis(M) {}

  bool run() override;
  std::string AnalysisName() const override { return "NoBranchAnalysis"; }

private:
  std::set<CallInst *> AcquireCalls();
};

#endif
