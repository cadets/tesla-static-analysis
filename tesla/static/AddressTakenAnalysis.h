#ifndef ADDRESS_TAKEN_ANALYSIS
#define ADDRESS_TAKEN_ANALYSIS

#include "Analysis.h"

using namespace llvm;

struct AddressTakenAnalysis : public Analysis {
  AddressTakenAnalysis(Module &M) : 
    Analysis(M) {}

  std::string AnalysisName() const override { return "AddressTakenAnalysis"; }
  bool run() override;
};

#endif
