#ifndef MODEL_GENERATOR_H
#define MODEL_GENERATOR_H

#include "Automaton.h"
#include "Manifest.h"
#include "tesla.pb.h"

#include <vector>

using std::vector;
using namespace tesla;

struct ModelGenerator {
  ModelGenerator(Expression &e, Manifest *man) :
    Man(man), Expr(e) {}

  /**
   * Should maybe return empty vector as the sentinel value that indicates there
   * are no more values left to return.
   */
  vector<Expression *> next(); 

private:
  vector<Expression *> fromExpression(const Expression &ex);
  vector<Expression *> fromSequence(const Sequence &ex);
  vector<Expression *> fromBoolean(const BooleanExpr &ex);
  vector<Expression *> fromAssertionSite(const AssertionSite &ex);
  vector<Expression *> fromFunction(const FunctionEvent &ex);
  vector<Expression *> fromFieldAssign(const FieldAssignment &ex);
  vector<Expression *> fromSubAutomaton(const Automaton &ex);

  Manifest *Man;
  Expression &Expr;
};

#endif
