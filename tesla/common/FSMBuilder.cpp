#include "Debug.h"
#include "FSMBuilder.h"

#include <llvm/Support/raw_ostream.h>
using llvm::errs;

std::string FSMBuilder::NextLabel() {
  return "_s" + std::to_string(label++);
}

FiniteStateMachine<Expression *> FSMBuilder::FSM()
{
  return ExpressionFSM(Expr);
}

FiniteStateMachine<Expression *> FSMBuilder::ExpressionFSM(const Expression &ex) {
  switch(ex.type()) {
    case Expression_Type_NULL_EXPR:
      return NullFSM();

    case Expression_Type_BOOLEAN_EXPR:
      return BooleanFSM(ex.booleanexpr());

    case Expression_Type_SEQUENCE:
      return SequenceFSM(ex.sequence());

    case Expression_Type_ASSERTION_SITE:
      return AssertionSiteFSM(ex.assertsite());

    case Expression_Type_FUNCTION:
      return FunctionEventFSM(ex.function());

    case Expression_Type_FIELD_ASSIGN:
      return FieldAssignFSM(ex.fieldassign());

    case Expression_Type_SUB_AUTOMATON:
      auto sub = Man->FindAutomaton(ex.subautomaton());
      return SubAutomatonFSM(*sub);
  }
}

FiniteStateMachine<Expression *> FSMBuilder::BooleanFSM(const BooleanExpr &ex) {
  if(ex.operation() == BooleanExpr::BE_And) {
    tesla::panic("Can't use AND in an assertion");

  } else if(ex.operation() == BooleanExpr::BE_Or) {
    if(ex.expression_size() == 0) {
      tesla::panic("Empty OR - impossible?");
    }

    auto fsm = ExpressionFSM(ex.expression(0)); 

    for(auto i = 1; i < ex.expression_size(); i++) {
      fsm = fsm.CrossProduct(ExpressionFSM(ex.expression(i)));
    }

    return fsm;

  } else if(ex.operation() == BooleanExpr::BE_Xor) {
    FiniteStateMachine<Expression *> fsm;

    auto initial_added = fsm.AddState(NextLabel());
    initial_added->initial = true;

    auto accept_added = fsm.AddState(NextLabel());
    accept_added->accepting = true;

    for(auto i = 0; i < ex.expression_size(); i++) {
      auto sub_fsm = ExpressionFSM(ex.expression(i));

      fsm.AddSubMachine(sub_fsm);
      fsm.AddEdge(initial_added, sub_fsm.InitialState());
      sub_fsm.InitialState()->initial = false;

      for(const auto& sub_accept : sub_fsm.AcceptingStates()) {
        fsm.AddEdge(sub_accept, accept_added);
        sub_accept->accepting = false;
      }
    }

    if(ex.expression_size() == 0) {
      fsm.AddEdge(initial_added, accept_added);
    }

    return fsm;
  }

  tesla::panic("Unknown type of boolean expression");
}

FiniteStateMachine<Expression *> FSMBuilder::SequenceOnceFSM(const Sequence &ex) {
  auto fsm = FiniteStateMachine<Expression *>{};

  auto initial_state = ::State{NextLabel()};
  initial_state.initial = true;

  auto accept_state = ::State{NextLabel()};
  accept_state.accepting = true;

  auto initial_added = fsm.AddState(initial_state);
  auto accept_added = fsm.AddState(accept_state);

  auto tails = std::set<std::shared_ptr<::State>>{ initial_added };

  for(auto i = 0; i < ex.expression_size(); i++) {
    auto sub_fsm = ExpressionFSM(ex.expression(i));
    fsm.AddSubMachine(sub_fsm);

    for(const auto& accept : tails) {
      accept->accepting = false;
      fsm.AddEdge(accept, sub_fsm.InitialState());
    }

    sub_fsm.InitialState()->initial = false;

    tails = sub_fsm.AcceptingStates();
  }

  for(const auto& accept : tails) {
    accept->accepting = false;
    fsm.AddEdge(accept, accept_added);
  }
 
  initial_added->initial = true;
  return fsm;
}

FiniteStateMachine<Expression *> FSMBuilder::SequenceFSM(const Sequence &ex) {
  auto fsm = FiniteStateMachine<Expression *>{};

  auto initial_state = ::State{NextLabel()};
  initial_state.initial = true;

  auto accept_state = ::State{NextLabel()};
  accept_state.accepting = true;

  auto initial_added = fsm.AddState(initial_state);
  auto accept_added = fsm.AddState(accept_state);

  auto tails = std::set<std::shared_ptr<::State>>{ initial_added };

  if(ex.maxreps() == std::numeric_limits<int>::max()) {
    for(auto i = 0; i < ex.minreps(); i++) {
      auto rep = SequenceOnceFSM(ex);
      fsm.AddSubMachine(rep);

      for(const auto& accept : tails) {
        accept->accepting = false;
        fsm.AddEdge(accept, rep.InitialState());
      }

      rep.InitialState()->initial = false;
      tails = rep.AcceptingStates();
    }

    fsm.AddEdge(accept_added, initial_added);
  } else {
    for(auto i = 1; i <= ex.maxreps(); i++) {
      auto rep = SequenceOnceFSM(ex);
      fsm.AddSubMachine(rep);

      for(const auto& accept : tails) {
        accept->accepting = false;
        fsm.AddEdge(accept, rep.InitialState());

        if(i >= ex.minreps()) {
          for(const auto& rep_accept : rep.AcceptingStates()) {
            fsm.AddEdge(rep_accept, accept_added);
          }
        }
      }

      rep.InitialState()->initial = false;

      tails = rep.AcceptingStates();
    }
  }

  for(const auto& accept : tails) {
    accept->accepting = false;
    fsm.AddEdge(accept, accept_added);
  }

  initial_added->initial = true;
  return fsm;
}

FiniteStateMachine<Expression *> FSMBuilder::AssertionSiteFSM(const AssertionSite &ex) {
  auto fsm = FiniteStateMachine<Expression *>{};

  auto initial_state = ::State{NextLabel()};
  initial_state.initial = true;

  auto accept_state = ::State{NextLabel()};
  accept_state.accepting = true;

  auto initial_added = fsm.AddState(initial_state);
  auto accept_added = fsm.AddState(accept_state);

  auto expr = new Expression;
  expr->set_type(Expression_Type_ASSERTION_SITE);
  *expr->mutable_assertsite() = ex;

  fsm.AddEdge(initial_added, accept_added, expr);

  return fsm;
}

FiniteStateMachine<Expression *> FSMBuilder::FunctionEventFSM(const FunctionEvent &ex) {
  auto fsm = FiniteStateMachine<Expression *>{};

  auto initial_state = ::State{NextLabel()};
  initial_state.initial = true;

  auto accept_state = ::State{NextLabel()};
  accept_state.accepting = true;

  auto initial_added = fsm.AddState(initial_state);
  auto accept_added = fsm.AddState(accept_state);

  auto expr = new Expression;
  expr->set_type(Expression_Type_FUNCTION);
  *expr->mutable_function() = ex;

  fsm.AddEdge(initial_added, accept_added, expr);

  return fsm;
}

FiniteStateMachine<Expression *> FSMBuilder::FieldAssignFSM(const FieldAssignment &ex) {
  auto fsm = FiniteStateMachine<Expression *>{};

  auto initial_state = ::State{NextLabel()};
  initial_state.initial = true;

  auto accept_state = ::State{NextLabel()};
  accept_state.accepting = true;

  auto initial_added = fsm.AddState(initial_state);
  auto accept_added = fsm.AddState(accept_state);

  auto expr = new Expression;
  expr->set_type(Expression_Type_FIELD_ASSIGN);
  *expr->mutable_fieldassign() = ex;

  fsm.AddEdge(initial_added, accept_added, expr);

  return fsm;
}

FiniteStateMachine<Expression *> FSMBuilder::SubAutomatonFSM(const Automaton &ex) {
  return ExpressionFSM(ex.getAssertion().expression());
}

FiniteStateMachine<Expression *> FSMBuilder::NullFSM() {
  auto fsm = FiniteStateMachine<Expression *>{};
  auto accept = ::State{NextLabel()};
  accept.accepting = true;
  accept.initial = true;

  fsm.AddState(accept);
  return fsm;
}
