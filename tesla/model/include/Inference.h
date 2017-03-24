#ifndef INFERENCE_H
#define INFERENCE_H

#include <llvm/IR/Value.h>
#include <llvm/Support/Casting.h>
#include <llvm/Support/raw_ostream.h>

#include <initializer_list>
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

  virtual Condition *Simplified() const = 0;
  virtual const std::string str() const = 0;
};

/**
 * A condition representing constant `true`.
 *
 * As far as I can see, we don't need `false` for now as we have no negation.
 */
struct ConstTrue : public Condition {
  ConstTrue() : Condition(CK_ConstTrue) {}
  
  Condition *Simplified() const override;

  static bool classof(const Condition *C) {
    return C->getKind() == CK_ConstTrue;
  }

  const std::string str() const {
    return "true";
  }
};

/**
 * A condition that constrains an LLVM value to a constant true / false.
 */
struct Branch : public Condition {
  Branch(Value *v, bool c) : 
    Condition(CK_Branch), value(v), constraint(c) {}

  Condition *Simplified() const override;

  static bool classof(const Condition *C) {
    return C->getKind() == CK_Branch;
  }

  const std::string str() const {
    std::string out;
    raw_string_ostream os(out);
    os << value << "=" << (constraint ? "true" : "false");
    return out;
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
struct And : public LogicalOp {
  template<class InputIt>
  And(InputIt first, InputIt last) :
    LogicalOp(first, last, CK_And) {}

  And(std::initializer_list<Condition *> il) : 
    And(il.begin(), il.end()) {}

  And() : And({}) {}

  static bool classof(const Condition *C) {
    return C->getKind() == CK_And;
  };

  const std::string str() const {
    std::string out;
    raw_string_ostream os(out);

    if(operands.empty()) {
      os << "true[&]";
    } else {
      os << "(";
      for(auto it = operands.begin(); it != operands.end() - 1; it++) {
        os << (*it)->str();
        os << " & ";
      }
      os << (*(operands.end() - 1))->str();
      os << ")";
    }

    return out; 
  }
};

/**
 * Logical or of several conditions.
 */
struct Or : public LogicalOp {
  template<class InputIt>
  Or(InputIt first, InputIt last) :
    LogicalOp(first, last, CK_Or) {}

  Or(std::initializer_list<Condition *> il) : 
    Or(il.begin(), il.end()) {}

  Or() : Or({}) {}

  static bool classof(const Condition *C) {
    return C->getKind() == CK_Or;
  }

  const std::string str() const {
    std::string out;
    raw_string_ostream os(out);

    if(operands.empty()) {
      os << "false[|]";
    } else {
      os << "(";
      for(auto it = operands.begin(); it != operands.end() - 1; it++) {
        os << (*it)->str();
        os << " | ";
      }
      os << (*(operands.end() - 1))->str();
      os << ")";
    }

    return out; 
  }
};

#endif
