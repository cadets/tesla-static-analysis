#ifndef Z3_CHECKER_H
#define Z3_CHECKER_H

#include "Manifest.h"
#include "tesla.pb.h"
#include "TraceFinder.h"

#include <fsm/finite_state_machine.h>

#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

#include <set>

using namespace llvm;

class Z3TraceChecker;

/*!
 * A single model checker result.
 *
 * Wraps a collection of contextual data to allow for counterexamples to be
 * printed at the point of discovery.
 */
class CheckResult {
public:
  /*!
   * Was the check successful. If not, why did it fail?
   *
   * \ref Unexpected represents the case where a particular event causes a
   * transition failure in the checking automaton, and \ref Incomplete
   * represents a trace that terminates in a non-accepting state of the
   * automaton.
   */
  enum Status {
    Unexpected, Incomplete, Success
  };

  /// Construct a successful check result.
  CheckResult();

  /// Construct an \ref Incomplete result from the final state.
  CheckResult(const Z3TraceChecker c, std::shared_ptr<::State> s);

  /// Construct an \ref Unexpected result for a state with no transitions at
  /// all.
  CheckResult(const Z3TraceChecker c, std::shared_ptr<::State> s,
              const CallInst *e);

  /// Construct an individual \ref Unexpected result with the associated \ref
  /// tesla::Expression.
  CheckResult(const Z3TraceChecker c, std::shared_ptr<::State> s, 
              const CallInst *e, const tesla::Expression expr);

  /// Print a single failure to standard error.
  void dump() const;

  /// Print a set of related failures to standard error.
  static void dump_many(const std::vector<CheckResult>& results);

  /// Compute the call stack from the trace and point of failure.
  std::vector<std::string> call_stack() const;

  /// Was the check successful?
  operator bool() const { return reason_ == Success; }

private:
  /// Internal constructor for delegation.
  CheckResult(Status r, const Z3TraceChecker c, 
              std::shared_ptr<::State> s, const CallInst *e);

  /// Extract event data from a call site.
  static std::string pretty_event(const CallInst* ci);

  std::unique_ptr<const Z3TraceChecker> checker_;
  Status reason_;
  std::shared_ptr<::State> state_;
  const CallInst* event_;
  std::unique_ptr<const tesla::Expression> expr_;
};

/*!
 * Model checker for a \ref tesla::Expression.
 *
 * Performs inlining and trace generation against the bounding function, then
 * creates a \ref Z3TraceChecker for each generated trace.
 */
class Z3Checker {
public:
  /*! 
   * Construct a model checker instance.
   *
   * The only work done at construction time is building a finite state machine
   * from \param expr.
   */
  Z3Checker(Function& bound, tesla::Manifest& man, 
            tesla::Expression& expr, size_t depth);

  /*!
   * Perform model checking for the expression and bounding function.
   *
   * Constructs a \ref Z3TraceChecker for each trace generated from the bounding
   * function. If all traces are safe, the assertion is safe.
   */
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
  bool match_arg(const Value* x, const Value* y) const;

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
