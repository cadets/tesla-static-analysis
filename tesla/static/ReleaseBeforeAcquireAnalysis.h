#ifndef RELEASE_BEFORE_ACQUIRE_H
#define RELEASE_BEFORE_ACQUIRE_H

#include "Analysis.h"

#include <string>

struct ReleaseBeforeAcquireAnalysis : public Analysis {
  bool run() override;
  std::string AnalysisName() const override { return "ReleaseBeforeAcquireAnalysis"; } 
};

#endif
