#include <array>
#include <string>

#include <llvm/IR/LegacyPassManager.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Scalar.h>
#include <llvm/Transforms/Utils/Cloning.h>

#include "Arguments.h"
#include "FSMBuilder.h"
#include "InlineAllPass.h"
#include "Names.h"
#include "StubFunctionsPass.h"
#include "ModelChecker.h"
#include "Z3Solver.h"

using llvm::legacy::PassManager;

static cl::opt<bool>
PrintCounterexamples("print-counter", cl::desc("Print counterexample info to stderr"),
                     cl::init(false));

Z3Checker::Z3Checker(Function& bound, tesla::Manifest& man, 
                     tesla::Expression& expr, size_t depth) :
  bound_(bound), depth_(depth),
  fsm_(FSMBuilder(expr, &man).FSM().Deterministic().Relabeled())
{
}

Z3TraceChecker::Z3TraceChecker(Function& tf, Module& mod,
                               const std::map<const CallInst *, long long> cons,
                               const FiniteStateMachine<tesla::Expression *>& fsm) :
  bound_(tf), module_(mod), trace_(TraceFinder::linear_trace(tf)), 
  constraints_(cons), fsm_(fsm)
{
  checked_functions_.insert(tesla::INLINE_ASSERTION);

  const auto& labels = fsm_.AllLabels();
  for(const auto& expr : labels) {
    if(expr->type() == Expression_Type_FUNCTION) {
      auto prefix = [&] {
        switch(expr->function().direction()) {
          case FunctionEvent_Direction_Entry: return "__entry_stub_";
          case FunctionEvent_Direction_Exit: return "__return_stub_";
        }
      }();

      checked_functions_.insert(prefix + expr->function().function().name());
    }
  }
}

bool Z3Checker::is_safe() const
{
  auto finder = TraceFinder{bound_};

  auto all_safe = true;
  for(auto i = 0; i < depth_; i++) {
    auto traces = finder.of_length(i);

    for(const auto& trace : traces) {
      auto&& names = ValueMap<Value *, std::string>{};
      if(auto trace_fn = finder.from_trace(trace, names)) {
        auto&& solver = Z3Visitor(*trace_fn, names);
        solver.run();

        auto&& checker = Z3TraceChecker{*trace_fn, *bound_.getParent(), solver.get_constraints(), fsm_};
        all_safe = checker.is_safe();
      }

      if(!all_safe) { 
        return all_safe;
      }
    }
  }

  return all_safe;
}

bool Z3TraceChecker::check_event(const CallInst& CI, const tesla::Expression& expr) const
{
  switch(expr.type()) {
    case Expression_Type_FUNCTION:
      return check_function(CI, expr.function());

    case Expression_Type_ASSERTION_SITE:
      return check_assert(CI, expr.assertsite());

    default:
      assert(false && "FSM shouldn't have this kind of expression in it!");
  }
}

bool Z3TraceChecker::match_arg(const Value* x, const Value* y) const
{
  if(isa<LoadInst>(x) && isa<LoadInst>(y)) {
    auto lx = cast<LoadInst>(x);
    auto ly = cast<LoadInst>(y);

    return lx->getPointerOperand() == ly->getPointerOperand();
  }
  return x == y;
}

bool Z3TraceChecker::check_function(const CallInst& CI, const tesla::FunctionEvent& expr) const
{
  using namespace std::string_literals;

  auto called_or_cast = calledOrCastFunction(&CI);
  if(!called_or_cast) {
    return false;
  }

  auto stubbed_name = called_or_cast->getName().str();
  auto called_name = remove_stub(stubbed_name);
  
  if(called_name != expr.function().name()) {
    return false;
  }

  if(has_prefix(stubbed_name, "__entry_stub"s) && 
     expr.direction() != FunctionEvent_Direction_Entry) {
    return false;
  }

  if(has_prefix(stubbed_name, "__return_stub"s) && 
     expr.direction() != FunctionEvent_Direction_Exit) {
    return false;
  }

  if(has_prefix(stubbed_name, "__return_stub"s) &&
     expr.has_expectedreturnvalue()) {

    auto found = constraints_.find(&CI);
    if(found == std::end(constraints_)) {
      return false;
    }

    if(found->second != expr.expectedreturnvalue().value()) {
      return false;
    }
  }

  BasicBlock &entry = bound_.getEntryBlock();
  Instruction *first = entry.getFirstNonPHIOrDbgOrLifetime();
  IRBuilder<> B(first);

  std::map<const tesla::Argument *, Value *> arg_map{};

  std::vector<const tesla::Argument *> named_args{};
  for(auto& ex_arg : expr.argument()) {
    if(ex_arg.type() != tesla::Argument::Any && ex_arg.type() != tesla::Argument::Constant) {
      named_args.push_back(&ex_arg);
    }
  }

  std::vector<tesla::Argument> deref_args{};
  for(const auto& arg : named_args) { deref_args.push_back(*arg); }

  auto collected = tesla::CollectArgs(first, deref_args, module_, B);
  assert(collected.size() == named_args.size() && "Size mismatch");

  for(auto i = 0; i < collected.size(); ++i) {
    arg_map[named_args[i]] = collected[i];
  }

  const auto check = [&] {
    std::vector<Value *> call_args{};
    for(auto i = 0; i < CI.getNumArgOperands(); i++) {
      call_args.push_back(CI.getArgOperand(i));
    }

    auto all_match = true;
    for(auto i = 0; i < expr.argument_size(); i++) {
      if(!all_match) { break; }

      const auto& ex_arg = expr.argument(i);

      switch(ex_arg.type()) {
        case Argument_Type_Any:
          break;
        case Argument_Type_Constant:
          if(auto cst = dyn_cast<ConstantInt>(call_args[i])) {
            all_match = all_match && 
                        (cst->getSExtValue() == ex_arg.value());
          } else {
            all_match = false;
          }
          break;
        default:
          assert(arg_map.find(&ex_arg) != arg_map.end() && "Argument list broken");
          all_match = all_match && match_arg(arg_map.find(&ex_arg)->second, call_args[i]);
          break;
      }
    }

    return all_match;
  };

  return check();
}

bool Z3TraceChecker::check_assert(const CallInst& CI, const tesla::AssertionSite& expr) const
{
  if(calledOrCastFunction(&CI)->getName().str() == tesla::INLINE_ASSERTION) {
    auto loc = tesla::Location{};
    tesla::ParseAssertionLocation(&loc, &CI);
    return expr.location() == loc;
  }

  return false;
}

std::pair<std::shared_ptr<::State>, bool> 
Z3TraceChecker::next_state(const CallInst& CI, std::shared_ptr<::State> state) const
{
  for(const auto& edge : fsm_.Edges(state)) {
    assert(!edge.IsEpsilon() && "FSM for checking must be deterministic");
    if(check_event(CI, *edge.Value())) {
      return std::make_pair(edge.End(), true);
    }
  }

  return std::make_pair(state, false);
}

std::vector<CheckResult>
Z3TraceChecker::edge_failures(const CallInst& CI, std::shared_ptr<::State> state) const
{
  auto fails = std::vector<CheckResult>{};
  for(const auto& edge : fsm_.Edges(state)) {
    assert(!edge.IsEpsilon() && "FSM for checking must be deterministic");
    fails.emplace_back(*this, state, &CI, *edge.Value());
  }
  return fails;
}

std::string Z3TraceChecker::remove_stub(const std::string name)
{
  const auto prefixes = std::array<std::string, 2>{{"__entry_stub_", "__return_stub_"}};
  for(const auto& prefix : prefixes) {
    if(has_prefix(name, prefix)) {
      return name.substr(prefix.size());
    }
  }

  return name;
}

bool Z3TraceChecker::possibly_checked(const CallInst& CI) const
{
  auto called_or_cast = calledOrCastFunction(&CI);
  if(!called_or_cast) {
    return false;
  }

  const auto& name = called_or_cast->getName().str();
  const auto found = checked_functions_.find(name);
  return found != std::end(checked_functions_);
}

bool Z3TraceChecker::is_safe() const
{
  auto no_asserts_checked = std::none_of(trace_.begin(), trace_.end(),
    [](auto bb) {
      return std::any_of(bb->begin(), bb->end(),
        [](auto& I) {
          if(auto ci = dyn_cast<CallInst>(&I)) {
            return calledOrCastFunction(ci)->getName().str() == tesla::INLINE_ASSERTION;
          }
          return false;
        }
      );
    }
  );
  if(no_asserts_checked) { return CheckResult{}; }

  auto state = fsm_.InitialState();

  for(const auto& bb : trace_) {
    for(const auto& I : *bb) {
      if(auto CI = dyn_cast<CallInst>(&I)) {
        auto&& pair = next_state(*CI, state);
        state = pair.first;

        if(!pair.second && possibly_checked(*CI)) {
          if(PrintCounterexamples) {
            auto&& failures = edge_failures(*CI, state);
            if(failures.empty()) {
              CheckResult{*this, state, CI}.dump();
            } else {
              CheckResult::dump_many(failures);
            }
          }
          return false;
        }
      }
    }
  }
  
  if(!state->accepting && PrintCounterexamples) {
    CheckResult{*this, state}.dump();
  }
  
  return state->accepting;
}
