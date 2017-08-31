#include <set>

#include <llvm/IR/Instructions.h>
#include <llvm/Transforms/Utils/Cloning.h>

#include "InlineAllPass.h"

InlineAllPass::InlineAllPass(size_t d) :
  FunctionPass(ID), depth_(d)
{
}

bool InlineAllPass::runOnFunction(Function &F)
{
  for(auto i = 0; i < depth_; i++) {
    auto calls = std::set<CallInst *>{};

    for(auto& BB : F) {
      for(auto& I : BB) {
        if(auto CI = dyn_cast<CallInst>(&I)) {
          calls.insert(CI);
        }
      }
    }

    InlineFunctionInfo IFI;
    for(auto& call : calls) {
      InlineFunction(call, IFI);
    }
  }

  return true;
}

char InlineAllPass::ID = 0;
