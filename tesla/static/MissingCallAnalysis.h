#ifndef MISSING_CALL_ANALYSIS_H
#define MISSING_CALL_ANALYSIS_H

#include "Analysis.h"
#include "SimpleCallGraph.h"

using namespace llvm;

struct MissingCallAnalysis : public Analysis {
  MissingCallAnalysis(Module &M, Function &F) :
    Analysis(M), CG(M), Bound(F) {}

  std::string AnalysisName() const override { return "MissingCallAnalysis"; }
  bool run() override;
private:
  SimpleCallGraph CG;
  Function &Bound;
};

#endif
