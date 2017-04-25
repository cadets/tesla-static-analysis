#include <llvm/PassManager.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Scalar.h>

#include "FSMBuilder.h"
#include "inline_all_pass.h"
#include "stub_functions_pass.h"
#include "z3_checker.h"
#include "z3_solve.h"

Z3Checker::Z3Checker(tesla::Manifest &man, Module &mo) :
  manifest_(man), module_(mo)
{
  PassManager Passes;
  Passes.add(createPromoteMemoryToRegisterPass());
  Passes.add(new StubFunctionsPass);
  Passes.run(module_);
}

bool Z3Checker::check_usage(const tesla::Usage *use, size_t unroll, size_t mc_bound)
{
  if(!has_checkable_bounds(use)) {
    return false;
  }

  auto automaton = manifest_.FindAutomaton(use->identifier());
  auto expr = automaton->getAssertion().expression();

  auto fsm = FSMBuilder(expr, &manifest_).FSM().Deterministic().Relabeled();
  auto bound = bound_function(use);
  if(!bound) {
    return false;
  }

  auto&& inliner = InlineAllPass(unroll);
  inliner.runOnFunction(*bound);

  auto all_safe = true;

  auto finder = TraceFinder{*bound};
  for(auto i = 0; i < mc_bound; i++) {
    auto traces = finder.of_length(i);
    errs() << "Solving " << i << '\n';
    for(const auto& trace : traces) {
      auto&& names = ValueMap<Value *, std::string>{};
      if(auto trace_fn = finder.from_trace(trace, names)) {
        auto&& solver = Z3Visitor(*trace_fn, names);
        solver.run();
        all_safe = check_trace(trace, solver.get_constraints(), fsm);
      }

      if(!all_safe) {
        return false;
      }
    }
  }

  return all_safe;
}

bool Z3Checker::check_trace(TraceFinder::trace_type trace, 
                            std::map<CallInst *, long long> constraints, 
                            FiniteStateMachine<tesla::Expression *> fsm)
{
  return false;
}

bool Z3Checker::has_checkable_bounds(const tesla::Usage *use) const
{
  const auto& begin = use->beginning();
  const auto& end = use->end();

  if(begin.type() != Expression_Type_FUNCTION ||
     end.type() != Expression_Type_FUNCTION) {
    return false;
  }

  const auto& begin_event = begin.function();
  const auto& end_event = end.function();
  
  if(begin_event.direction() != FunctionEvent_Direction_Entry ||
     end_event.direction() != FunctionEvent_Direction_Exit) {
    return false;
  }

  return begin_event.function().name() == end_event.function().name();
}

Function *Z3Checker::bound_function(const tesla::Usage *use) const
{
  if(!has_checkable_bounds(use)) {
    return nullptr;
  }

  return module_.getFunction(use->end().function().function().name());
}
