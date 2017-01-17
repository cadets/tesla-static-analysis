#ifndef ACQ_REL_MOD_PASS_H
#define ACQ_REL_MOD_PASS_H

#include <llvm/Pass.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/raw_ostream.h>

using namespace llvm;

struct AcquireReleaseCheck : public ModulePass {
  AcquireReleaseCheck();
  virtual bool runOnModule(Module &M);
  virtual void getAnalysisUsage(AnalysisUsage &AU) const;
  void print(raw_ostream &OS, const Module *m = 0) const;

  static char ID;
};

#endif
