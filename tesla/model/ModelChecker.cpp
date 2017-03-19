#include <numeric>
#include <map>
#include <vector>

#include "Debug.h"
#include "ModelChecker.h"
#include "ModelGenerator.h"
#include "SequenceExpressions.h"

using std::map;
using std::vector;

set<const tesla::Usage *> ModelChecker::SafeUsages() {
  set<const tesla::Usage *> safeUses;

  for(auto use : Manifest->RootAutomata()) {
    auto automaton = Manifest->FindAutomaton(use->identifier());
    auto expr = automaton->getAssertion().expression();

    auto Gen = ModelGenerator(expr, Manifest);
    auto n = Gen.ofLength(Depth + 1);
    
    auto safe = true; 

    auto allTraces = FiniteTraces{Graph}.OfLengthUpTo(Depth);
    auto boundedTraces = FiniteTraces::BoundedBy(allTraces, Bound);
    auto cyclicTraces = FiniteTraces::Cyclic(allTraces);

    for(auto trace : boundedTraces) {
      auto exists = false;
      for(auto model : n) {
        exists = exists || CheckAgainst(trace, model);
      }
      safe = safe && exists;
    }

    if(safe) {
      safeUses.insert(use);
    }
  }

  return safeUses;
}

bool ModelChecker::CheckAgainst(const FiniteTraces::Trace &tr, const ModelGenerator::Model &mod) {
  return false;
}

CheckResult ModelChecker::CheckState(const tesla::Expression &ex, const FiniteTraces::Trace &tr, int ind) {
  switch(ex.type()) {
    case tesla::Expression_Type_BOOLEAN_EXPR:
      return CheckBoolean(ex.booleanexpr(), tr, ind);

    case tesla::Expression_Type_SEQUENCE:
      return CheckSequence(ex.sequence(), tr, ind);

    case tesla::Expression_Type_NULL_EXPR:
      return CheckNull(tr, ind);

    case tesla::Expression_Type_ASSERTION_SITE:
      return CheckAssertionSite(ex.assertsite(), tr, ind);

    case tesla::Expression_Type_FUNCTION:
      return CheckFunction(ex.function(), tr, ind);

    case tesla::Expression_Type_FIELD_ASSIGN:
      return CheckFieldAssign(ex.fieldassign(), tr, ind);

    case tesla::Expression_Type_SUB_AUTOMATON:
      auto sub = Manifest->FindAutomaton(ex.subautomaton());
      return CheckSubAutomaton(*sub, tr, ind);
  }
}

/**
 * Collects all the checked expressions from the expression then reduces them
 * according to the operation in the expression (and / or / xor).
 */
CheckResult ModelChecker::CheckBoolean(const tesla::BooleanExpr &ex, const FiniteTraces::Trace &tr, int ind) {
  //errs() << "bool\n";

  switch(ex.operation()) {
    case tesla::BooleanExpr_Operation_BE_Or:
      assert(false && "Or not implemented...");
      break;
    case tesla::BooleanExpr_Operation_BE_Xor:
      for(int i = 0; i < ex.expression_size(); i++) {
        auto res = CheckState(ex.expression(i), tr, ind);
        if(res.Successful()) {
          return res;
        }
      }
      break;
    case tesla::BooleanExpr_Operation_BE_And:
      assert(false && "And not implemented...");
      break;
  }

  return CheckResult::Failed();
}

CheckResult ModelChecker::CheckSequence(const tesla::Sequence &ex, 
                                        const FiniteTraces::Trace &tr, 
                                        int ind)
{
  return CheckSequenceOnce(ex, tr, ind);
}

/*
 * I *think* that sequences should be the sole way to handle recursing through
 * the graph - a one event sequence is equivalent to something like X[P] in LTL,
 * whereas every other type should just be checked at the current state.
 */
CheckResult ModelChecker::CheckSequenceOnce(const tesla::Sequence &ex, 
                                            const FiniteTraces::Trace &tr, 
                                            int ind, bool mustComplete)
{
  //errs() << "(*) seq [" << ex.expression_size() << "] at: " << ind << '\n';
  
  map<int, tesla::Expression *> mapping;
  
  int seqInd = 0;
  int len = 0;
  for(int i = ind; i < tr.size(); ) {
    if(seqInd >= ex.expression_size()) {
      return CheckResult::Success(ind, len, mapping);
    }

    auto res = CheckState(ex.expression(seqInd), tr, i);
    
    if(res.Successful()) {
      for(auto pair : res.mapping) {
        mapping[pair.first] = pair.second;
      }

      seqInd++;
      len = i + res.Length() - ind;
      i += res.Length();
    } else {
      i++;
    }
  }

  for(auto pair : mapping) {
    errs() << pair.first << " ";
  }

  if(mustComplete) {
    return CheckResult::Failed(mapping);
  } else {
    return CheckResult::Success(ind, len, mapping);
  }
}

/**
 * Any state satisfies a null expression.
 */
CheckResult ModelChecker::CheckNull(const FiniteTraces::Trace &tr, int ind) {
  //errs() << "null\n";
  return CheckResult::Success(ind, 0);
}

/**
 * Check passes in the state if we have the same location attached to an
 * assert event.
 */
CheckResult ModelChecker::CheckAssertionSite(const tesla::AssertionSite &ex, const FiniteTraces::Trace &tr, int ind) {
  //errs() << "assert: " << tr[ind]->GraphViz() << '\n';

  if(auto ae = dyn_cast<AssertEvent>(tr[ind])) {
    if(ex.location() == ae->Location()) {
      auto success = CheckResult::Success(ind, 1);
      
      auto expr = new tesla::Expression;
      *expr->mutable_assertsite() = ex;
      expr->set_type(tesla::Expression_Type_ASSERTION_SITE);
      success.mapping[ind] = expr;

      return success;
    }
  }

  return CheckResult::Failed();
}

/**
 * When checking a function event, we look up the function named by the event in
 * our module, then see if it's the same as the one on the event (but only if
 * the event is an en, int indy / exit event with the correct direction).
 */
CheckResult ModelChecker::CheckFunction(const tesla::FunctionEvent &ex, 
                                        const FiniteTraces::Trace &tr, 
                                        int ind) 
{
  //errs() << "func\n";
  auto modFn = Mod->getFunction(ex.function().name());

  auto success = CheckResult::Success(ind, 1);
  auto expr = new tesla::Expression;
  *expr->mutable_function() = ex;
  expr->set_type(tesla::Expression_Type_FUNCTION);
  success.mapping[ind] = expr;

  if(auto ent = dyn_cast<EntryEvent>(tr[ind])) {
    if(ex.direction() == tesla::FunctionEvent_Direction_Entry) {
      if(modFn && ent->Func && modFn == ent->Func) {
        return success;
      }
    }
  }

  if(auto exit = dyn_cast<ExitEvent>(tr[ind])) {
    if(ex.direction() == tesla::FunctionEvent_Direction_Exit) {
      if(modFn && exit->Func && modFn == exit->Func) {
        return success;
      }
    }
  }

  return CheckResult::Failed();
}

/**
 * Currently no state can satisfy a field assignment, but this might be changed
 * in the future when the event graph mechanism is upgraded.
 */
CheckResult ModelChecker::CheckFieldAssign(const tesla::FieldAssignment &ex, const FiniteTraces::Trace &tr, int ind) {
  //errs() << "assign\n";
  return CheckResult::Failed();
}

/**
 * Subautomaton checking just recurses into the named automaton's logical
 * expression at the current state.
 */
CheckResult ModelChecker::CheckSubAutomaton(const tesla::Automaton &ex, const FiniteTraces::Trace &tr, int ind) {
  return CheckState(ex.getAssertion().expression(), tr, ind);
}
