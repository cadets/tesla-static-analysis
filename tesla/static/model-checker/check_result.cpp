#include <llvm/Support/raw_ostream.h>

#include "Arguments.h"
#include "Names.h"
#include "z3_checker.h"

static bool is_assert(const CallInst* ci)
{
  return calledOrCastFunction(ci)->getName().str() == tesla::INLINE_ASSERTION; 
};

static bool is_entry(const CallInst* ci)
{
  using namespace std::string_literals;
  return has_prefix(calledOrCastFunction(ci)->getName().str(), "__entry_stub_"s);
};

static bool is_return(const CallInst* ci)
{
  using namespace std::string_literals;
  return has_prefix(calledOrCastFunction(ci)->getName().str(), "__return_stub_"s);
};

CheckResult::CheckResult(FailureReason r, const Z3TraceChecker c, 
                         std::shared_ptr<::State> s, const CallInst *e) :
  checker_(std::make_unique<decltype(c)>(c)), reason_(r),
  state_(s), event_(e)
{
}

CheckResult::CheckResult() :
  checker_(nullptr), reason_(None),
  state_(nullptr), event_(nullptr)
{
}

CheckResult::CheckResult(const Z3TraceChecker c, std::shared_ptr<::State> s) :
  CheckResult(Incomplete, c, s, nullptr)
{
}

CheckResult::CheckResult(const Z3TraceChecker c, std::shared_ptr<::State> s,
                         const CallInst *e) :
  CheckResult(Unexpected, c, s, e)
{
}

CheckResult::CheckResult(const Z3TraceChecker c, std::shared_ptr<::State> s, 
                         const CallInst *e, const tesla::Expression expr) :
  checker_(std::make_unique<decltype(c)>(c)), 
  reason_(Unexpected), state_(s), event_(e),
  expr_(std::make_unique<const tesla::Expression>(expr))
{
}

void CheckResult::dump() const
{
  if(reason_ == CheckResult::Incomplete) {
    errs() << "Full trace not accepted by automaton (ended in state " 
           << state_->name << ")\n";
  } else {
    errs() << "No possible transitions from state " << state_->name << '\n';
    errs() << "Received event: " << pretty_event(event_) << '\n';
  }
  errs() << "FSM:\n";
  errs() << checker_->fsm_.Dot() << '\n';

  errs() << "Call stack:\n";
  for(const auto& call : call_stack()) {
    errs() << "  " << call << '\n';
  }
  errs() << '\n';
}

void CheckResult::dump_many(const std::vector<CheckResult>& results)
{
  auto&& fail = results.front();
  errs() << "Unexpected event in state " << fail.state_->name << '\n';

  errs() << "Received event: " << pretty_event(fail.event_);
  if(is_return(fail.event_)) {
    auto found = fail.checker_->constraints_.find(fail.event_);
    if(found != std::end(fail.checker_->constraints_)) {
      errs() << " (return value == " << found->second << ")";
    }
  }
  errs() << '\n';

  errs() << "FSM:\n";
  errs() << fail.checker_->fsm_.Dot() << '\n';

  errs() << "Call stack:\n";
  for(const auto& call : fail.call_stack()) {
    errs() << "  " << call << '\n';
  }
  errs() << '\n';
}

std::string CheckResult::pretty_event(const CallInst* ci)
{
  using namespace std::string_literals;
  std::stringstream ss;

  if(is_assert(ci)) {
    ss << "assertion site";
  } else if(is_entry(ci)) {
    ss << "entry to " 
       << Z3TraceChecker::remove_stub(calledOrCastFunction(ci)->getName().str());
  } else if(is_return(ci)) {
    ss << "return from " 
       << Z3TraceChecker::remove_stub(calledOrCastFunction(ci)->getName().str());
  }

  return ss.str();
}

std::vector<std::string> CheckResult::call_stack() const
{
  auto call_stack = std::vector<std::string>{};

  for(auto&& BB : checker_->trace_) {
    for(auto&& I : *BB) {
      if(&I == event_) {
        return call_stack;
      }

      if(auto ci = dyn_cast<CallInst>(&I)) {
        auto name = calledOrCastFunction(ci)->getName().str();

        if(is_entry(ci)) {
          call_stack.push_back("call: " + Z3TraceChecker::remove_stub(name));
        }

        if(is_return(ci)) {
          call_stack.push_back("return: " + Z3TraceChecker::remove_stub(name));
        }
      }
    }
  }

  return call_stack;
}
