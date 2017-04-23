#ifndef STUB_FUNCTIONS_PASS_H
#define STUB_FUNCTIONS_PASS_H

#include <llvm/Pass.h>

using namespace llvm;

class StubFunctionsPass : public ModulePass {
public:
  StubFunctionsPass();

  bool runOnModule(Module &M);

  static char ID;
};

#endif
