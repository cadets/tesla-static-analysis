#ifndef INSTRUMENTER_REMOVE_H
#define INSTRUMENTER_REMOVE_H

#include "Instrumenter.h"
#include "Transition.h"

#include <llvm/IR/Instruction.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/Pass.h>

namespace tesla {

class RemoveInstrumenter : public Instrumenter, public llvm::ModulePass {
public:
  static char ID;
  RemoveInstrumenter(const Manifest& M, bool SuppressDI)
    : Instrumenter(M, SuppressDI), ModulePass(ID) {}
  virtual ~RemoveInstrumenter();

  const char* getPassName() const {
    return "TESLA assertion site instrumenter";
  }

  virtual bool runOnModule(llvm::Module &M);

private:
  bool ShouldDelete(llvm::Instruction &I);
};

}

#endif
