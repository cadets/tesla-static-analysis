#ifndef NO_BRANCH_ANALYSIS_H
#define NO_BRANCH_ANALYSIS_H

#include "Analysis.h"

struct NoBranchAnalysis : public Analysis {
  NoBranchAnalysis(Module &M) : Analysis(M) {}

  virtual bool run() override;
  virtual std::string AnalysisName() const override;
};

#endif
