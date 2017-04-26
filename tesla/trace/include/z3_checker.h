#ifndef Z3_CHECKER_H
#define Z3_CHECKER_H

#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

#include <fsm/finite_state_machine.h>

#include "Manifest.h"
#include "tesla.pb.h"
#include "trace_finder.h"

using namespace llvm;

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

  bool is_safe() const;
private: 
  bool check_event(const CallInst& CI, const tesla::Expression& expr) const;
  bool check_function(const CallInst& CI, const tesla::FunctionEvent& expr) const;
  bool check_assert(const CallInst& CI, const tesla::AssertionSite& expr) const;

  std::pair<std::shared_ptr<::State>, bool> 
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
