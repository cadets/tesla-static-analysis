#ifndef MODEL_GENERATOR_H
#define MODEL_GENERATOR_H

#include "Automaton.h"
#include "fsm/finite_state_machine.h"
#include "Manifest.h"
#include "tesla.pb.h"

#include <vector>
#include <set>

using std::vector;
using std::set;
using namespace tesla;

struct ModelGenerator {
  using Model = vector<Expression *>;
  ModelGenerator(Expression &e, Manifest *man) :
    Man(man), Expr(e) {}

  set<Model> ofLength(size_t length);
private:
  set<Model> fromExpression(const Expression &ex, size_t length);
  set<Model> fromSequence(const Sequence &ex, size_t length);
  set<Model> fromSequence(const Sequence &ex, size_t length, size_t index);
  set<Model> fromBoolean(const BooleanExpr &ex, size_t length);
  set<Model> fromAssertionSite(const AssertionSite &ex, size_t length);
  set<Model> fromFunction(const FunctionEvent &ex, size_t length);
  set<Model> fromFieldAssign(const FieldAssignment &ex, size_t length);
  set<Model> fromSubAutomaton(const Automaton &ex, size_t length);
  std::string NextLabel();

public:
  FiniteStateMachine<Expression> ExpressionFSM(const Expression &ex);
  FiniteStateMachine<Expression> BooleanFSM(const BooleanExpr &ex);
  FiniteStateMachine<Expression> SequenceOnceFSM(const Sequence &ex);
  FiniteStateMachine<Expression> SequenceFSM(const Sequence &ex);
  FiniteStateMachine<Expression> NullFSM();

private:
  int label = 0;
  Manifest *Man;
  Expression &Expr;
};

#endif
