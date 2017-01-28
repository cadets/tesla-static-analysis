#ifndef RELEASE_DOMINANCE_ANALYSIS_H
#define RELEASE_DOMINANCE_ANALYSIS_H

#include "Analysis.h"

using namespace llvm;

struct ReleaseDominanceAnalysis : public Analysis {
  ReleaseDominanceAnalysis(Module &M, Function &F) :
    Analysis(M), Bound(F) {}

  std::string AnalysisName() const override { return "ReleaseDominanceAnalysis"; }
  bool run() override;
private:
  Function &Bound;
};

#endif
