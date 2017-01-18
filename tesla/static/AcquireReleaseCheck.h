#ifndef ACQ_REL_MOD_PASS_H
#define ACQ_REL_MOD_PASS_H

#include <llvm/Pass.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/Support/raw_ostream.h>

#include <string>
#include <vector>

#include "Automaton.h"
#include "Arguments.h"

using std::string;
using namespace llvm;

struct AcquireReleaseCheck : public ModulePass {
  AcquireReleaseCheck(const tesla::Automaton &A, std::vector<tesla::Argument> args);
  
  bool CorrectUsage() { return correctUsage; }

  virtual bool runOnModule(Module &M);
  virtual void getAnalysisUsage(AnalysisUsage &AU) const;
  virtual const char *getPassName() const;
  void print(raw_ostream &OS, const Module *m = 0) const;
  static char ID;
private:
  bool correctUsage;
  const string boundName;
  const tesla::Automaton &automaton;
  std::vector<tesla::Argument> args;
};

#endif
