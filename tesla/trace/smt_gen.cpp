#include <sstream>

#include <llvm/IR/Instructions.h>
#include <llvm/Support/raw_ostream.h>

#include "smt_gen.h"

SMTVisitor::SMTVisitor(Function& f, ValueMap<Value *, std::string>& ns) :
  function_(f), names_(ns)
{
  for(const auto& pair : names_) {
    std::string inst_s;
    raw_string_ostream os{inst_s};
    os << *(pair.first);
    ss << "; " << pair.second << ":" << os.str() << '\n';
  }
  ss << "(set-option :print-success false)\n";
  ss << "(set-logic QF_UFLIA)\n";
}

void SMTVisitor::run()
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
          ss << "(assert (not |" << names_[cond] << "|))\n";
        } else if(false_dest == &sink) {
          ss << "(assert |" << names_[cond] << "|)\n";
        }
      }
    }
  }
}

void SMTVisitor::check()
{
  ss << "(check-sat)\n";
  ss << "(get-model)\n";
}

void SMTVisitor::visitBinaryOperator(BinaryOperator &BO)
{
  auto define = [&](std::string op) {
    ss << "(define-fun |" << names_[&BO] << "| () ";
    
    // Is the result of a binaryOp always an integer type?
    auto width = cast<IntegerType>(BO.getType())->getBitWidth();
    if(width == 1) {
      ss << "Bool";
    } else {
      ss << "Int";
    }

    ss << " (" << op << " ";
    ss << operand_str(BO.getOperand(0)) << " ";
    ss << operand_str(BO.getOperand(1));
    ss << ")";

    ss << ")\n";
  };

  switch(BO.getOpcode()) {
    case Instruction::Add:
      define("+");
      break;
    case Instruction::Sub:
      define("-");
      break;
    case Instruction::Mul:
      define("*");
      break;
    case Instruction::Xor:
      define("xor");
      break;
    case Instruction::Or:
      define("or");
      break;
    case Instruction::And:
      define("and");
      break;
    default:
      errs() << "Unhandled operation: ";
      BO.dump();
      break;
  }
}

void SMTVisitor::visitCallInst(CallInst &CI)
{
  ss << "(declare-fun |" << names_[&CI] << "| () ";
  if(called_returns_bool(CI)) {
    ss << "Bool";
  } else {
    ss << "Int";
  }
  ss << ")\n";
}

std::string SMTVisitor::operand_str(Value *V) const
{
  auto found = names_.find(V);
  if(found != names_.end()) {
    return "|" + found->second + "|";
  }

  if(auto cst = dyn_cast<ConstantInt>(V)) {
    if(cst->getBitWidth() == 1) {
      return cst->isOne() ? "true" : "false";
    } else {
      return std::to_string(cst->getSExtValue());
    }
  }

  return "__bad_operand__";
}

bool SMTVisitor::called_returns_bool(CallInst &CI) const
{
  auto fn = CI.getCalledFunction();
  if(!fn) { return false; }

  auto func_type = [&]() -> FunctionType* {
    auto ty = fn->getType();
    if(auto pt = dyn_cast<PointerType>(ty)) {
      if(auto ft = dyn_cast<FunctionType>(pt->getElementType())) {
        return ft;
      }
    }

    return nullptr;
  }();
  
  auto int_rt = [&]() -> IntegerType* {
    auto rt = func_type->getReturnType();
    if(auto irt = dyn_cast<IntegerType>(rt)) {
      return irt;
    }

    return nullptr;
  }();

  return (int_rt && int_rt->getBitWidth() == 1);
}
