#include <array>
#include <numeric>
#include <map>
#include <mutex>
#include <sstream>
#include <thread>
#include <vector>

#include "Debug.h"
#include "GraphTransforms.h"
#include "Inference.h"
#include "ModelChecker.h"
#include "ModelGenerator.h"
#include "SequenceExpressions.h"

using std::map;
using std::vector;

bool ModelChecker::IsUsageSafe(const tesla::Usage *use) {
  auto automaton = Manifest->FindAutomaton(use->identifier());
  auto expr = automaton->getAssertion().expression();

  auto fsm = ModelGenerator(expr, Manifest).FSM().Deterministic().Relabeled();

  auto work_queue = std::queue<int>{};
  for(auto i = 0; i < Depth; i++) {
    work_queue.push(i+1);
  }
  auto done = false;
  auto&& mut = std::mutex{};

  auto n_cores = Sequential ? 1 : std::thread::hardware_concurrency();
  auto&& trace_gen = FiniteTraces{Graph};

  const auto thread_worker = [&](bool cycle) {
    while(!work_queue.empty() && !done) {
      int d;
      {
        std::lock_guard<std::mutex> lock(mut);
        if(!work_queue.empty()) {
          d = work_queue.front();
          work_queue.pop();
        } else {
          return;
        }
      }

      auto allTraces = trace_gen.OfLength(d);
      auto traces = decltype(allTraces){};
      if(cycle) {
        traces = FiniteTraces::Cyclic(allTraces);
      } else {
        traces = FiniteTraces::BoundedBy(allTraces, Bound);
      }

      for(auto trace : traces) {
        auto filt = filteredTrace(trace, expr);

        auto exists = CheckAgainstFSM(filt, fsm.Deterministic(), cycle);

        std::lock_guard<std::mutex> lock(mut);
        if(!exists && !done) {
          errs() << "Counterexample of length " << trace.size() << '\n';
          for(const auto& ev : trace) {
            errs() << "  " << ev->GraphViz() << '\n';
          }
          errs() << "May not satisfy assertion:\n  " << automaton->SourceCode() << "\n\n";
          errs() << "FSM:\n" << fsm.Dot() << '\n';

          done = true;
        }
      }
    }
  };

  auto threads = std::vector<std::thread>{};

  if(PreferTerminating) {
    // If we prefer terminating counterexamples (probably easier to understand),
    // then search for those first, and only if none exist do we run the cyclic
    // checker
    for(auto i = 0; i < n_cores; i++) {
      threads.push_back(std::thread(thread_worker, false));
    }
    std::for_each(std::begin(threads), std::end(threads), [](auto& t) { t.join(); });

    threads.clear();

    for(auto i = 0; i < n_cores; i++) {
      threads.push_back(std::thread(thread_worker, true));
    }
    std::for_each(std::begin(threads), std::end(threads), [](auto& t) { t.join(); });
  } else {
    // Otherwise, just run them all together
    for(auto i = 0; i < n_cores; i++) {
      threads.push_back(std::thread(thread_worker, false));
      threads.push_back(std::thread(thread_worker, true));
    }
    std::for_each(std::begin(threads), std::end(threads), [](auto& t) { t.join(); });
  }

  return !done;
}

set<const tesla::Usage *> ModelChecker::SafeUsages() {
  set<const tesla::Usage *> safeUses;

  for(auto use : Manifest->RootAutomata()) {
    if(IsUsageSafe(use)) {
      safeUses.insert(use);
    }
  }

  return safeUses;
}

bool ModelChecker::CheckAgainstFSM(const FiniteTraces::Trace &tr, const FiniteStateMachine<Expression *> fsm, bool cycle)
{
  struct work_item {
    work_item(std::shared_ptr<::State> s, size_t b, std::shared_ptr<BoolValue> e) :
      state(s), begin(b), expr(e) {}

    std::shared_ptr<::State> state;
    size_t begin;
    std::shared_ptr<BoolValue> expr;

    bool operator<(const work_item& o) const {
      return std::tie(state, begin, expr) < std::tie(o.state, o.begin, o.expr);
    }
  };

  auto labels = fsm.AllLabels();
  auto no_asserts_checked = std::none_of(tr.begin(), tr.end(), 
    [&](auto e) {
      if(auto ae = dyn_cast<AssertEvent>(e)) {
        return std::any_of(labels.begin(), labels.end(), 
			   [&](auto as) { return CheckState(*as, ae); });
      }

      return false;
    }
  );
  if(no_asserts_checked) { return true; }

  auto start_state = fsm.InitialState();

  auto work_queue = std::stack<work_item>{};
  work_queue.push(work_item(start_state, 0, nullptr));

  auto visited = std::set<work_item>{};

  while(!work_queue.empty()) {
    auto next = work_queue.top();
    work_queue.pop();

    if(visited.find(next) == visited.end()) {
      visited.insert(next);
    } else {
      continue;
    }

    if((cycle || next.state->accepting) && next.begin == tr.size()) {
      return true;
    }

    if(next.begin >= tr.size()) {
      continue;
    }

    for(const auto& edge : fsm.Edges(next.state)) {
      auto new_c = next.expr;

      auto accepts = edge.Accepts<Event *>(tr[next.begin], [=,&new_c](auto ev, auto ex) { 
        auto bigram_match = true;

        if(auto exe = dyn_cast<ExitEvent>(ev)) {
          if(exe->Call && hasReturnConstraint(ex)) {
            auto val = static_cast<bool>(getReturnConstraint(ex));
            auto&& constraint = std::make_shared<BoolValue>(exe->Call, val);

            bigram_match = bigram_match && ConstraintsOccur(BBGraph, {*constraint});

            if(next.expr) {
              auto&& bigram = std::make_pair(*next.expr, *constraint);
              bigram_match = bigram_match && AssertionPairs.find(bigram) != AssertionPairs.end();
            }

            new_c = constraint;
          }
        }

        return CheckState(*ex, ev, true) && bigram_match;
      });

      if(accepts) {
        work_queue.push(work_item(edge.End(), next.begin+1, new_c));
      }
    }
  }

  return false;
}

bool ModelChecker::hasReturnConstraint(Expression *e) {
  if(e->type() != Expression_Type_FUNCTION) {
    return false;
  }

  auto func = e->function();
  if(!func.has_direction() || func.direction() != FunctionEvent_Direction_Exit) {
    return false;
  }

  if(!func.has_expectedreturnvalue()) {
    return false;
  }

  auto ret = func.expectedreturnvalue();
  return ret.type() == Argument_Type_Constant && ret.has_value();
}

int ModelChecker::getReturnConstraint(Expression *e) {
  return e->function().expectedreturnvalue().value();
}

set<BoolValue> ModelChecker::FollowSet(Event *e) {
  auto c = std::set<Event *>{};
  return FollowSet(e, c);
}

set<BoolValue> ModelChecker::FollowSet(Event *e, std::set<Event *> &cache) {
  auto here = set<BoolValue>{};
  if(auto bb = dyn_cast<BasicBlockEvent>(e)) {
    for(auto inf : bb->Inferences) {
      here.insert(*inf);
    }
  }

  auto possible = set<BoolValue>{};

  for(auto suc : e->successors) {
    if(auto bb = dyn_cast<BasicBlockEvent>(suc)) {
      for(auto inf : bb->Inferences) {
        auto found = here.find(*inf);
        if(found == here.end()) {
          possible.insert(*inf);
        }
      }
    }
  }

  if(!possible.empty()) {
    return possible;
  }

  cache.insert(e);
  for(auto suc : e->successors) {
    if(cache.find(suc) == cache.end()) {
      auto fs = FollowSet(suc, cache);
      for(auto inf : fs) {
        possible.insert(inf);
      }
    }
  }

  return possible;
}

bool ModelChecker::ConstraintsOccur(EventGraph *eg, std::vector<BoolValue> constraints) {
  set<BoolValue> cs{constraints.begin(), constraints.end()};
  set<BoolValue> found;

  for(auto ev : eg->getEvents()) {
    if(auto bb = dyn_cast<BasicBlockEvent>(ev)) {
      for(auto inf : bb->Inferences) {
        found.insert(*inf);
      }
    }
  }

  auto all = true;
  for(auto ev : cs) {
    all = all && (found.find(ev) != found.end());
  }

  return all;
}

bool ModelChecker::CheckState(const tesla::Expression &ex, Event *event, bool args) {
   switch(ex.type()) {
    case tesla::Expression_Type_ASSERTION_SITE:
      return CheckAssertionSite(ex.assertsite(), event);

    case tesla::Expression_Type_FUNCTION:
      if(args) {
        return CheckFunction(ex.function(), event);
      } else {
        return CheckFunctionNoArgs(ex.function(), event);
      }

    default:
      assert(false && "This should not happen");
      return false;
  }
}

bool ModelChecker::CheckAssertionSite(const tesla::AssertionSite &ex, Event *event) {
  if(auto ae = dyn_cast<AssertEvent>(event)) {
    if(ex.location() == ae->Location()) {
      return true;
    }
  }

  return false;
}

bool ModelChecker::CheckFunction(const tesla::FunctionEvent &ex, Event *event) {
  auto modFn = Mod->getFunction(ex.function().name());

  // Builds a mapping from arguments to LLVM values (which is only valid for
  // named values)
  std::map<const tesla::Argument *, Value *> arg_map{};
  {
    std::lock_guard<std::mutex> lock{args_mutex};

    BasicBlock &entry = Bound->getEntryBlock();
    Instruction *first = entry.getFirstNonPHIOrDbgOrLifetime();
    IRBuilder<> B(first);

    std::vector<const tesla::Argument *> named_args{};
    for(auto& ex_arg : ex.argument()) {
      if(ex_arg.type() != tesla::Argument::Any && ex_arg.type() != tesla::Argument::Constant) {
        named_args.push_back(&ex_arg);
      }
    }

    std::vector<tesla::Argument> deref_args{};
    for(const auto& arg : named_args) { deref_args.push_back(*arg); }

    auto collected = tesla::CollectArgs(first, deref_args, *Mod, B);
    assert(collected.size() == named_args.size() && "Size mismatch");

    for(auto i = 0; i < collected.size(); ++i) {
      arg_map[named_args[i]] = collected[i];
    }
  }

  const auto check = [&](auto ev) {
    if(modFn && ev->Call && calledOrCastFunction(ev->Call) == modFn) {
      std::vector<Value *> call_args{};
      for(auto i = 0; i < ev->Call->getNumArgOperands(); i++) {
        call_args.push_back(ev->Call->getArgOperand(i));
      }

      auto all_match = true;
      for(auto i = 0; i < ex.argument_size(); i++) {
        if(!all_match) { break; }

        const auto& ex_arg = ex.argument(i);

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
            all_match = all_match && (arg_map.find(&ex_arg)->second == call_args[i]);
            break;
        }
      }

      return all_match;
    }

    return false;
  };

  if(auto entry = dyn_cast<EntryEvent>(event)) {
    if(ex.direction() == tesla::FunctionEvent_Direction_Entry) {
      if(check(entry)) { return true; }
    }
  }

  if(auto exit = dyn_cast<ExitEvent>(event)) {
    if(ex.direction() == tesla::FunctionEvent_Direction_Exit) {
      if(check(exit)) { return true; }
    }
  }

  return false;
}

bool ModelChecker::CheckFunctionNoArgs(const tesla::FunctionEvent &ex, Event *event) {
  auto modFn = Mod->getFunction(ex.function().name());

  if(auto ent = dyn_cast<EntryEvent>(event)) {
    if(ex.direction() == tesla::FunctionEvent_Direction_Entry) {
      if(modFn && ent->Func && modFn == ent->Func) {
        return true;
      }
    }
  }

  if(auto exit = dyn_cast<ExitEvent>(event)) {
    if(ex.direction() == tesla::FunctionEvent_Direction_Exit) {
      if(modFn && exit->Func && modFn == exit->Func) {
        return true;
      }
    }
  }

  return false;
}

FiniteTraces::Trace ModelChecker::filteredTrace(const FiniteTraces::Trace &tr, const tesla::Expression ex) {
  auto subExprs = SubExpressions(*Manifest).Get(ex);

  FiniteTraces::Trace filt;

  for(auto ev : tr) {
    for(auto sub : subExprs) {
      if(CheckState(*sub, ev, false)) {
        filt.push_back(ev);
        break;
      }
    }
  }

  return filt;
}
