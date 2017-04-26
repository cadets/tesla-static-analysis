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

struct FSMBuilder {
  FSMBuilder(Expression &e, Manifest *man) :
    Man(man), Expr(e) {}

  FiniteStateMachine<Expression *> FSM();

private:
  std::string NextLabel();

  FiniteStateMachine<Expression *> ExpressionFSM(const Expression &ex);
  FiniteStateMachine<Expression *> SequenceOnceFSM(const Sequence &ex);
  FiniteStateMachine<Expression *> SequenceFSM(const Sequence &ex);
  FiniteStateMachine<Expression *> BooleanFSM(const BooleanExpr &ex);
  FiniteStateMachine<Expression *> SubAutomatonFSM(const Automaton &ex);
  FiniteStateMachine<Expression *> AssertionSiteFSM(const AssertionSite &ex);
  FiniteStateMachine<Expression *> FunctionEventFSM(const FunctionEvent &ex);
  FiniteStateMachine<Expression *> FieldAssignFSM(const FieldAssignment &ex);
  FiniteStateMachine<Expression *> NullFSM();

  int label = 0;
  Manifest *Man;
  Expression &Expr;
};

#endif
