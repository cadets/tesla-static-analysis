#ifndef MISSING_CALL_ANALYSIS_H
#define MISSING_CALL_ANALYSIS_H

#include "Analysis.h"

using namespace llvm;

struct MissingCallAnalysis : public Analysis {
  MissingCallAnalysis(Module &M, Function &F) :
    Analysis(M), Bound(F) {}

  std::string AnalysisName() const override { return "MissingCallAnalysis"; }
  bool run() override;
private:
  Function &Bound;
};

#endif
