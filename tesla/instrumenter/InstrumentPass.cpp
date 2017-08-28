#include <llvm/Pass.h>
#include <llvm/IR/Function.h>
#include <llvm/Support/raw_ostream.h>

using namespace llvm;

namespace {

struct Test : public ModulePass {
  static char ID;
  Test() : ModulePass(ID) {}

  bool runOnModule(Module& M) override {
    errs() << "Module!\n";
    return false;
  }
};

char Test::ID = 0;

static RegisterPass<Test> X("test", "test pass",
                            false, false);

}
