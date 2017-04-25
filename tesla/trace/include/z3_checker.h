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
  Z3Checker(tesla::Manifest &man, Module &mo);

  bool check_usage(const tesla::Usage *use, size_t unroll, size_t bound);
private:
  tesla::Manifest& manifest_;
  Module& module_;

  bool check_trace(TraceFinder::trace_type trace, 
                   std::map<CallInst *, long long> constraints, 
                   FiniteStateMachine<tesla::Expression *> fsm);
  bool has_checkable_bounds(const tesla::Usage *use) const;
  Function *bound_function(const tesla::Usage *use) const;
};

#endif
