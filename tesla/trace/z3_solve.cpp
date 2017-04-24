#include <llvm/Support/raw_ostream.h>
#include <iostream>

#include "z3_solve.h"

void Z3Visitor::run()
{
  visit(function_);
  errs() << str() << '\n';
}

void Z3Visitor::visitBinaryOperator(BinaryOperator &BO)
{
  auto result = value_expr(&BO);
  auto lhs = value_expr(BO.getOperand(0));
  auto rhs = value_expr(BO.getOperand(1));

  auto body = [&] {
    switch(BO.getOpcode()) {
    case Instruction::Add: return lhs + rhs;
    case Instruction::Sub: return lhs - rhs;
    case Instruction::Mul: return lhs * rhs;
    case Instruction::Xor: return lhs != rhs;
    case Instruction::Or: return lhs || rhs;
    case Instruction::And: return lhs && rhs;
    default:
      BO.dump();
      assert(false && "Unhandled operation");
    }
  }();

  solver_.add(result == body);
}

void Z3Visitor::visitCallInst(CallInst &CI)
{
  /*auto fn = cast<Function>(CI.getCalledValue()->stripPointerCasts());
  auto result_ty = fn->getFunctionType()->getReturnType();
  if(isa<IntegerType>(result_ty)) {
    solver_.add(value_expr(&CI));
  }*/
}

void Z3Visitor::visitLoadInst(LoadInst &LI)
{
}

void Z3Visitor::visitCmpInst(CmpInst &CI)
{
  if(!CI.isIntPredicate()) {
    return;
  }

  auto result = value_expr(&CI);
  auto lhs = value_expr(CI.getOperand(0));
  auto rhs = value_expr(CI.getOperand(1));

  auto body = [&] {
    switch(CI.getPredicate()) {
    case CmpInst::ICMP_EQ: return lhs == rhs;
    case CmpInst::ICMP_NE: return lhs != rhs;
    case CmpInst::ICMP_UGT:
    case CmpInst::ICMP_SGT: return lhs > rhs;
    case CmpInst::ICMP_UGE:
    case CmpInst::ICMP_SGE: return lhs >= rhs;
    case CmpInst::ICMP_ULT:
    case CmpInst::ICMP_SLT: return lhs < rhs;
    case CmpInst::ICMP_ULE:
    case CmpInst::ICMP_SLE: return lhs <= rhs; 
    default:
      CI.dump();
      assert(false && "Unhandled comparison op!");
    }
  }();

  solver_.add(result == body);
}

std::string Z3Visitor::str() const
{
  std::stringstream ss;
  ss << solver_;
  return ss.str();
}

z3::sort Z3Visitor::value_sort(Value *v)
{
  auto width = cast<IntegerType>(v->getType())->getBitWidth();
  if(width == 1) {
    return context_.bool_sort();
  } else {
    return context_.int_sort();
  }
}

z3::expr Z3Visitor::value_expr(Value *v)
{
  auto name = names_.find(v);
  if(name != names_.end()) {
    auto sort = value_sort(v);
    return context_.constant(name->second.c_str(), sort);
  }

  if(auto cst = dyn_cast<ConstantInt>(v)) {
    if(cst->getBitWidth() == 1) {
      return context_.bool_val(cst->isOne());
    } else {
      return context_.int_val((__int64)cst->getSExtValue());
    }
  }

  v->dump();
  assert(false && "Unhandled value - can't get Z3 expr!");
}
