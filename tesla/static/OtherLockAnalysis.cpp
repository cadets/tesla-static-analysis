#include "OtherLockAnalysis.h"

OtherLockAnalysis::OtherLockAnalysis(Module &M, Function &F, Value &V) 
  : Analysis(M), Bound(F), Lock(V)
{
}

bool OtherLockAnalysis::run() const {
  return false;
}

std::string OtherLockAnalysis::AnalysisName() const {
  return "OtherLockAnalysis";
}
