#include <llvm/IR/Constants.h>
#include <llvm/IR/Instructions.h>

#include "BackwardsSearch.h"

using namespace llvm;

BoolValue *BackwardsSearch::From(BoolValue b) {
  auto next = &b;

  do {
    if(isa<CallInst>(next->GetValue())) {
      return next;
    }
  } while((next = Resolve(*next)));

  return nullptr;
}

BoolValue *BackwardsSearch::Resolve(BoolValue b) {
  auto bop = dyn_cast<BinaryOperator>(b.GetValue());
  if(!bop) {
    return nullptr;
  }

  ConstantInt *constArg = nullptr;
  Value *otherArg = nullptr;

  for(auto i = 0; i < bop->getNumOperands(); i++) {
    auto operand = bop->getOperand(i);

    if(auto constOper = dyn_cast<ConstantInt>(operand)) {
      constArg = constOper;
      otherArg = bop->getOperand(1-i);
    }
  }

  if(!constArg) {
    return nullptr;
  }

  auto constVal = constArg->getValue().getBoolValue();

  switch(bop->getOpcode()) {
    case Instruction::Xor:
      return new BoolValue{otherArg, constVal != b.GetConstraint()};
    default:
      assert(false && "Unhandled op type for resolution!");
  }
}
