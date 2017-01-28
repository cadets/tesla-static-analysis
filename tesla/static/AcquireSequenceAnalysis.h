#ifndef ACQUIRE_SEQUENCE_ANALYSIS_H
#define ACQUIRE_SEQUENCE_ANALYSIS_H

#include "Analysis.h"

using namespace llvm;

struct AcquireSequenceAnalysis : public Analysis {
  AcquireSequenceAnalysis(Module &M) : Analysis(M) {}

  std::string AnalysisName() const override { return "AcquireSequenceAnalysis"; }
  bool run() override;
};

#endif
