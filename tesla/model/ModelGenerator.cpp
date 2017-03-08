#include "ModelGenerator.h"

vector<Expression *> ModelGenerator::next() {
  return fromExpression(Expr);
}

// these are the "eager" functions that give us what we want immediately

vector<Expression *> ModelGenerator::fromExpression(const Expression &ex) {
  switch(ex.type()) {
    case Expression_Type_BOOLEAN_EXPR:
      return fromBoolean(ex.booleanexpr());

    case Expression_Type_SEQUENCE:
      return fromSequence(ex.sequence());

    case Expression_Type_NULL_EXPR:
      return {};

    case Expression_Type_ASSERTION_SITE:
      return fromAssertionSite(ex.assertsite());

    case Expression_Type_FUNCTION:
      return fromFunction(ex.function());

    case Expression_Type_FIELD_ASSIGN:
      return fromFieldAssign(ex.fieldassign());

    case Expression_Type_SUB_AUTOMATON:
      auto sub = Man->FindAutomaton(ex.subautomaton());
      return fromSubAutomaton(*sub);
  }
}

// I think that these two probably want to take an additional parameter giving
// the expression to use OR the number of repetitions to generate.

vector<Expression *> ModelGenerator::fromSequence(const Sequence &ex) {
  vector<Expression *> exprs = {};
  
  for(int i = 0; i < ex.expression_size(); i++) {
    auto subs = fromExpression(ex.expression(i));
    for(auto e : subs) {
      exprs.push_back(e);
    }
  }

  return exprs;
}

vector<Expression *> ModelGenerator::fromBoolean(const BooleanExpr &ex) {
  return {};
}

vector<Expression *> ModelGenerator::fromAssertionSite(const AssertionSite &ex) {
  auto expr = new Expression;
  expr->set_type(Expression_Type_ASSERTION_SITE);
  *expr->mutable_assertsite() = ex;
  return {expr};
}

vector<Expression *> ModelGenerator::fromFunction(const FunctionEvent &ex) {
  auto expr = new Expression;
  expr->set_type(Expression_Type_FUNCTION);
  *expr->mutable_function() = ex;
  return {expr};
}

vector<Expression *> ModelGenerator::fromFieldAssign(const FieldAssignment &ex) {
  auto expr = new Expression;
  expr->set_type(Expression_Type_FIELD_ASSIGN);
  *expr->mutable_fieldassign() = ex;
  return {expr};
}

vector<Expression *> ModelGenerator::fromSubAutomaton(const Automaton &ex) {
  return fromExpression(ex.getAssertion().expression());
}
