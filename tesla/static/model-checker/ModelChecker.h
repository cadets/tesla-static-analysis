#ifndef Z3_CHECKER_H
#define Z3_CHECKER_H

#include <set>

#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

#include <fsm/finite_state_machine.h>

#include "Manifest.h"
#include "tesla.pb.h"
#include "TraceFinder.h"

using namespace llvm;

class Z3TraceChecker;

class CheckResult {
public:
  enum FailureReason {
    Unexpected, Incomplete, None
  };

  CheckResult();
  CheckResult(const Z3TraceChecker c, std::shared_ptr<::State> s);
  CheckResult(const Z3TraceChecker c, std::shared_ptr<::State> s,
              const CallInst *e);
  CheckResult(const Z3TraceChecker c, std::shared_ptr<::State> s, 
              const CallInst *e, const tesla::Expression expr);

  void dump() const;
  static void dump_many(const std::vector<CheckResult>& results);

  std::vector<std::string> call_stack() const;

  operator bool() const { return reason_ == None; }
private:
  CheckResult(FailureReason r, const Z3TraceChecker c, 
              std::shared_ptr<::State> s, const CallInst *e);

  static std::string pretty_event(const CallInst* ci);

  std::unique_ptr<const Z3TraceChecker> checker_;
  FailureReason reason_;
  std::shared_ptr<::State> state_;
  const CallInst* event_;
  std::unique_ptr<const tesla::Expression> expr_;
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
  friend class CheckResult;

public:
  Z3TraceChecker(Function& tf, Module& Mod,
                 const std::map<const CallInst *, long long> cons,
                 const FiniteStateMachine<tesla::Expression *>& fsm);

  bool is_safe() const;
protected: 
  bool check_event(const CallInst& CI, const tesla::Expression& expr) const;
  bool check_function(const CallInst& CI, const tesla::FunctionEvent& expr) const;
  bool check_assert(const CallInst& CI, const tesla::AssertionSite& expr) const;

  std::pair<std::shared_ptr<::State>, bool> 
    next_state(const CallInst& CI, std::shared_ptr<::State> state) const;

  std::vector<CheckResult>
    edge_failures(const CallInst& CI, std::shared_ptr<::State> state) const;

  static std::string remove_stub(const std::string name);
  bool possibly_checked(const CallInst& CI) const;

  Function &bound_;
  Module &module_;
  std::set<std::string> checked_functions_;
  std::vector<const BasicBlock *> trace_;
  const std::map<const CallInst *, long long> constraints_;
  const FiniteStateMachine<tesla::Expression *>& fsm_;
};

#endif
