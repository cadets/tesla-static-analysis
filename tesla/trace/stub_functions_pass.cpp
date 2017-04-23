#include <llvm/Support/raw_ostream.h>

#include "stub_functions_pass.h"

StubFunctionsPass::StubFunctionsPass() :
  ModulePass(ID)
{
}

bool StubFunctionsPass::runOnModule(Module &M)
{
  return false;
}

char StubFunctionsPass::ID = 0;
