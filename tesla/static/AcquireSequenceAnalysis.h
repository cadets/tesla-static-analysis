#ifndef ACQUIRE_SEQUENCE_ANALYSIS_H
#define ACQUIRE_SEQUENCE_ANALYSIS_H

#include "Analysis.h"

#include <llvm/IR/Instructions.h>

#include <map>
#include <set>

using std::map;
using std::set;
using namespace llvm;

struct AcquireSequenceAnalysis : public Analysis {
  AcquireSequenceAnalysis(Module &M, Function &F) : 
    Analysis(M), Bound(F) {}

  std::string AnalysisName() const override { return "AcquireSequenceAnalysis"; }
  bool run() override;
private:
  set<CallInst *> AcquireCalls();
  map<CallInst *, set<Value *>> AcquireUsages();
  Function &Bound;
};

#endif
