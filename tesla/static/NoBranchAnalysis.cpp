#include "NoBranchAnalysis.h"

bool NoBranchAnalysis::run() {
  return false;
}

std::string NoBranchAnalysis::AnalysisName() const {
  return "NoBranchAnalysis";
}
