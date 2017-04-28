#ifndef Z3_CHECKER_H
#define Z3_CHECKER_H

#include <set>

#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

#include <fsm/finite_state_machine.h>

#include "Manifest.h"
#include "tesla.pb.h"
#include "trace_finder.h"

using namespace llvm;

class CheckResult {
public:
  enum FailureReason {
    Constraint, Incomplete, Unexpected, None
  };

  CheckResult() :
    reason_(None) {}

  CheckResult(FailureReason fail, std::vector<const BasicBlock *> trace,
              const CallInst* event, std::shared_ptr<::State> state) :
    call_stack_(call_stack_from_trace(trace, event)),
    event_(event), state_(state), reason_(fail) {}

  void dump() const;

  operator bool() const { return reason_ == None; }
private:
  static std::vector<std::string> call_stack_from_trace(
      std::vector<const BasicBlock *> trace, const CallInst *fail);

  std::vector<std::string> call_stack_;
  const CallInst* event_;
  std::shared_ptr<::State> state_;
  FailureReason reason_;
};

class Z3Checker {
public:
  Z3Checker(Function& bound, tesla::Manifest& man, 
            tesla::Expression& expr, size_t depth);

  bool is_safe() const;

private:
  Function& bound_;
  size_t depth_;
  const FiniteStateMachine<tesla::Expression *> fsm_;
};

class Z3TraceChecker {
public:
  Z3TraceChecker(Function& tf, Module& Mod,
                 const std::map<const CallInst *, long long> cons,
                 const FiniteStateMachine<tesla::Expression *>& fsm);

  CheckResult is_safe() const;
private: 
  bool check_event(const CallInst& CI, const tesla::Expression& expr) const;
  bool check_function(const CallInst& CI, const tesla::FunctionEvent& expr) const;
  bool check_assert(const CallInst& CI, const tesla::AssertionSite& expr) const;

  std::pair<std::shared_ptr<::State>, CheckResult> 
    next_state(const CallInst& CI, std::shared_ptr<::State> state) const;

  std::string remove_stub(const std::string name) const;
  bool possibly_checked(const CallInst& CI) const;

  Function &bound_;
  Module &module_;
  std::set<std::string> checked_functions_;
  std::vector<const BasicBlock *> trace_;
  const std::map<const CallInst *, long long> constraints_;
  const FiniteStateMachine<tesla::Expression *>& fsm_;
};

#endif
