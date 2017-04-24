#include <llvm/Support/raw_ostream.h>
#include <iostream>

#include "z3_solve.h"

void Z3Visitor::run()
{
  visit(function_);

  auto& sink = *std::find_if(std::begin(function_), std::end(function_),
    [](auto& BB) { return BB.getName() == "__tesla_sink"; });

  for(auto& BB : function_) {
    auto term = BB.getTerminator();
    if(auto bi = dyn_cast<BranchInst>(term)) {
      if(bi->isConditional()) {
        auto cond = bi->getCondition();
        auto true_dest = bi->getSuccessor(0);
        auto false_dest = bi->getSuccessor(1);

        if(true_dest == &sink) {
          solver_.add(!value_expr(cond));
        } else if(false_dest == &sink) {
          solver_.add(value_expr(cond));
        }
      }
    }
  }

  solver_.check();

  errs() << str() << '\n';
  auto m = solver_.get_model();
  std::cerr << m << '\n';

  for(auto i = 0; i < m.size(); i++) {
    auto v = m[i];
    assert(v.arity() == 0 && "Non-constant interpretation shouldn't happen");

    auto val = m.get_const_interp(v);
    if(auto ci = dyn_cast_or_null<CallInst>(reverse_name_lookup(v.name().str()))) {
      auto constraint = [&] {
        if(val.is_bool()) {
          auto b = Z3_get_bool_value(context_, val);
          if(b == Z3_L_UNDEF) { assert(false && "Should have an interpretation"); }
          return (long long)(b == Z3_L_TRUE);
        } else if(val.is_int()) {
          long long l;
          Z3_get_numeral_int64(context_, m.get_const_interp(v), &l);
          return l;
        }

        assert(false && "Non int / bool interpretation");
      }();

      constraints_[ci] = constraint;
    }
  }

  errs() << '\n';
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

Value *Z3Visitor::reverse_name_lookup(std::string name) const
{
  for(const auto& pair : names_) {
    if(pair.second == name) {
      return pair.first;
    }
  }

  return nullptr;
}
