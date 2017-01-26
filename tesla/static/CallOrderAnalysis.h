#ifndef CALL_ORDER_ANALYSIS_H
#define CALL_ORDER_ANALYSIS_H

#include "Analysis.h"
#include "SimpleCallGraph.h"

#include <llvm/IR/Function.h>
#include <llvm/IR/Module.h>

struct CallOrderAnalysis : public Analysis {
  CallOrderAnalysis(Module &M, Function &F) : 
    Analysis(M), Bound(F), CG(M) {}

  bool run() override;
  std::string AnalysisName() const override { return "CallOrderAnalysis"; }
private:
  Function &Bound;
  SimpleCallGraph CG;
};

#endif
