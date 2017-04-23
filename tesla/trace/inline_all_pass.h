#ifndef INLINE_ALL_PASS_H
#define INLINE_ALL_PASS_H

#include <llvm/InstVisitor.h>
#include <llvm/Pass.h>

using namespace llvm;

class InlineAllPass : public FunctionPass {
public:
  InlineAllPass(size_t d);
  bool runOnFunction(Function &F);

  static char ID;
private:
  const size_t depth_;
};

#endif
