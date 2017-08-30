#include <llvm/Pass.h>
#include <llvm/IR/Function.h>
#include <llvm/Support/raw_ostream.h>

using namespace llvm;

namespace {

struct InstrumentPass : public ModulePass {
  static char ID;
  InstrumentPass() : ModulePass(ID) {}

  bool runOnModule(Module& M) override {
    return false;
  }
};

char InstrumentPass::ID = 0;

static RegisterPass<InstrumentPass> X("tesla-instrument", "Instrument IR with TESLA");

}
