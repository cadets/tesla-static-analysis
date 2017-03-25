#ifndef INFERENCE_H
#define INFERENCE_H

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/Casting.h>
#include <llvm/Support/raw_ostream.h>

#include <initializer_list>
#include <map>
#include <string>
#include <vector>

using namespace llvm;

/**
 * Abstract class that represents an inferred condition.
 *
 * These conditions are inferred from the results of branches we have taken to
 * get to a particular basic block within a function. In particular, the
 * condition we have represents the strongest condition we are able to infer
 * about a particular basic block.
 */
struct Condition {
  enum ConditionKind {
    CK_ConstTrue,
    CK_Branch,
    CK_And,
    CK_Or
  };

private:
  const ConditionKind Kind;

public:
  ConditionKind getKind() const { return Kind; }

  Condition(ConditionKind K) : Kind(K) {}

  virtual std::string str() const = 0;
  virtual Condition *Flattened() { return this; }
  virtual Condition *CNF() { return this; }

  static std::map<BasicBlock *, Condition *> StrongestInferences(Function *f);
  static Condition *BranchCondition(BasicBlock *pred, BasicBlock *succ);
};

/**
 * A condition representing constant `true`.
 *
 * As far as I can see, we don't need `false` for now as we have no negation.
 */
struct ConstTrue : public Condition {
  ConstTrue() : Condition(CK_ConstTrue) {}
  
  std::string str() const override;

  static bool classof(const Condition *C) {
    return C->getKind() == CK_ConstTrue;
  }
};

/**
 * A condition that constrains an LLVM value to a constant true / false.
 */
struct Branch : public Condition {
  Branch(Value *v, bool c) : 
    Condition(CK_Branch), value(v), constraint(c) {}

  std::string str() const override;

  static bool classof(const Condition *C) {
    return C->getKind() == CK_Branch;
  }

private:
  Value *value;
  bool constraint;
};

/**
 * Logical operation over several conditions.
 */
struct LogicalOp : public Condition {
  template<class InputIt>
  LogicalOp(InputIt first, InputIt last, ConditionKind K) :
    Condition(K), operands(first, last) {}

  LogicalOp(std::initializer_list<Condition *> il, ConditionKind K) :
    LogicalOp(il.begin(), il.end(), K) {}

  LogicalOp(ConditionKind K) :
    LogicalOp({}, K) {}

  void addOperand(Condition *C) { operands.push_back(C); }

  static bool classof(const Condition *C) {
    return C->getKind() >= CK_And && C->getKind() <= CK_Or;
  }

protected:
  std::vector<Condition *> operands;
};

/**
 * Logical and of several conditions.
 */
struct Or;
struct And : public LogicalOp {
  friend struct Or;

  template<class InputIt>
  And(InputIt first, InputIt last) :
    LogicalOp(first, last, CK_And) {}

  And(std::initializer_list<Condition *> il) : 
    And(il.begin(), il.end()) {}

  And() : And({}) {}

  std::string str() const override;

  And *FlattenAnd();
  Condition *Flattened() override { return FlattenAnd(); }
  Condition *CNF() override;

  static And *Product(std::vector<And *> ands);

  static bool classof(const Condition *C) {
    return C->getKind() == CK_And;
  };
};

/**
 * Logical or of several conditions.
 */
struct Or : public LogicalOp {
  friend struct And;

  template<class InputIt>
  Or(InputIt first, InputIt last) :
    LogicalOp(first, last, CK_Or) {}

  Or(std::initializer_list<Condition *> il) : 
    Or(il.begin(), il.end()) {}

  Or() : Or({}) {}

  std::string str() const override;

  Or *FlattenOr();
  Condition *Flattened() override { return FlattenOr(); }
  Condition *CNF() override;

  static bool classof(const Condition *C) {
    return C->getKind() == CK_Or;
  }
};

#endif
