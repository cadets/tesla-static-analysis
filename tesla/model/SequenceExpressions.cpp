#include "SequenceExpressions.h"

set<Expression *> SubExpressions::Get(const Expression ex) {
  switch(ex.type()) {
    case Expression_Type_BOOLEAN_EXPR:
      return SubExpressions::Get(ex.booleanexpr());

    case Expression_Type_SEQUENCE:
      return SubExpressions::Get(ex.sequence());

    case Expression_Type_NULL_EXPR:
      return {};

    case Expression_Type_ASSERTION_SITE:
      return SubExpressions::Get(ex.assertsite());

    case Expression_Type_FUNCTION:
      return SubExpressions::Get(ex.function());

    case Expression_Type_FIELD_ASSIGN:
      return SubExpressions::Get(ex.fieldassign());

    case Expression_Type_SUB_AUTOMATON:
      auto sub = Man.FindAutomaton(ex.subautomaton());
      return SubExpressions::Get(*sub);
  }
}

set<Expression *> SubExpressions::Get(const Sequence seq) {
  set<Expression *> ret;
  for(int i = 0; i < seq.expression_size(); i++) {
    auto subs = Get(seq.expression(i));
    ret.insert(subs.begin(), subs.end());
  }
  return ret;
}

set<Expression *> SubExpressions::Get(const BooleanExpr be) {
  return {};
}

set<Expression *> SubExpressions::Get(const AssertionSite as) {
  auto expr = new tesla::Expression;
  expr->set_type(Expression_Type_ASSERTION_SITE);
  *expr->mutable_assertsite() = as;

  return {expr};
}

set<Expression *> SubExpressions::Get(const FunctionEvent ev) {
  auto expr = new tesla::Expression;
  expr->set_type(Expression_Type_FUNCTION);
  *expr->mutable_function() = ev;

  return {expr};
}

set<Expression *> SubExpressions::Get(const FieldAssignment fa) {
  return {};
}

set<Expression *> SubExpressions::Get(const Automaton aut) {
  return Get(aut.getAssertion().expression());
}
