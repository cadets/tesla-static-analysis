#ifndef SEQUENCE_EXPRESSIONS_H
#define SEQUENCE_EXPRESSIONS_H

#include <set>

#include "Automaton.h"
#include "Manifest.h"
#include "tesla.pb.h"

using std::set;
using namespace tesla;

struct SubExpressions {
  SubExpressions(const Manifest &man) :
    Man(man) {}

  set<Expression *> Get(const Expression ex);
  set<Expression *> Get(const BooleanExpr be);
  set<Expression *> Get(const Sequence seq);
  set<Expression *> Get(const AssertionSite as);
  set<Expression *> Get(const FunctionEvent ev);
  set<Expression *> Get(const FieldAssignment fa);
  set<Expression *> Get(const Automaton aut);

private:
  const Manifest &Man;
};

#endif
