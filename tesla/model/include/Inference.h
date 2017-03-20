#ifndef INFERENCE_H
#define INFERENCE_H

#include <llvm/Support/Casting.h>

#include <string>
#include <vector>

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

  virtual Condition *Simplified() const = 0;
  virtual std::string str() const = 0;
};

/**
 * A condition representing constant `true`.
 *
 * As far as I can see, we don't need `false` for now as we have no negation.
 */
struct ConstTrue : public Condition {
  ConstTrue() : Condition(CK_ConstTrue) {}

  static bool classof(const Condition *C) {
    return C->getKind() == CK_ConstTrue;
  }
};

/**
 * A condition that constrains an LLVM value to a constant true / false.
 */
struct Branch : public Condition {
  Branch() : Condition(CK_Branch) {}

  static bool classof(const Condition *C) {
    return C->getKind() == CK_Branch;
  }
};

/**
 * Logical operation over several conditions.
 */
struct LogicalOp : public Condition {
  LogicalOp(Condition K) : Condition(K) {}

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
struct And : public LogicalOp {
  And() : LogicalOp(CK_And) {}

  static bool classof(const Condition *C) {
    return C->getKind() == CK_And;
  };
};

/**
 * Logical or of several conditions.
 */
struct Or : public LogicalOp {
  Or() : LogicalOp(CK_Or) {}

  static bool classof(const Condition *C) {
    return C->getKind() == CK_Or;
  }
};

#endif
