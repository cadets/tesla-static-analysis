#ifndef Z3_SOLVE_H
#define Z3_SOLVE_H

#include <sstream>

#include <llvm/InstVisitor.h>
#include <llvm/ADT/ValueMap.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>

#include <z3++.h>

using namespace llvm;

class Z3Visitor : public InstVisitor<Z3Visitor> {
public:
  Z3Visitor(Function &f, ValueMap<Value *, std::string>& ns) :
    function_(f), names_(ns), solver_(context_) {}

  void run();

  void visitBinaryOperator(BinaryOperator &BO);
  void visitCallInst(CallInst &CI);
  void visitLoadInst(LoadInst &LI);
  void visitCmpInst(CmpInst &CI);

  std::string str() const;
private:
  Function &function_;
  ValueMap<Value *, std::string>& names_;
  z3::context context_;
  z3::solver solver_;

  z3::sort value_sort(Value *);
  z3::expr value_expr(Value *v);
};

#endif
