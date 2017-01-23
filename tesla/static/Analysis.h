#ifndef ANALYSIS_H
#define ANALYSIS_H

#include <llvm/IR/Module.h>

#include <sstream>
#include <string>

using namespace llvm;

struct Analysis {
  Analysis(Module &M);
  void AddMessage(std::string e);
  std::string Message();
  virtual std::string AnalysisName() const = 0;
  virtual bool run() const = 0;

protected:
  Module &Mod;

private:
  std::stringstream errs;
};

#endif
