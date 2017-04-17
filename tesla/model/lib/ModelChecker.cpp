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

  auto Gen = ModelGenerator(expr, Manifest);

  auto work_queue = std::queue<int>{};
  for(auto i = 0; i < Depth; i++) {
    work_queue.push(i+1);
  }
  auto done = false;
  auto&& mut = std::mutex{};

  auto n_cores = std::thread::hardware_concurrency();
  auto&& trace_gen = FiniteTraces{Graph};

  auto n = Gen.ofLength(Depth * 2); // generate longer model for cyclic checks

  auto fsm = Gen.FSM();

  const auto thread_worker = [&] {
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
      auto boundedTraces = FiniteTraces::BoundedBy(allTraces, Bound);
      auto cyclicTraces = FiniteTraces::Cyclic(allTraces);

      for(auto trace : boundedTraces) {
        auto filt = filteredTrace(trace, expr);

        auto exists = CheckAgainstFSM(filt, fsm.Deterministic());

        std::lock_guard<std::mutex> lock(mut);
        if(!exists && !done) {
          errs() << "Counterexample of length " << trace.size() << '\n';
          for(const auto& ev : filt) {
            errs() << "  " << ev->GraphViz() << '\n';
          }
          errs() << "May not satisfy assertion:\n  " << automaton->SourceCode() << "\n\n";
          errs() << "FSM:\n" << fsm.Deterministic().Dot() << '\n';

          done = true;
        }
      }

      for(auto trace : cyclicTraces) {
        auto filt = filteredTrace(trace, expr);

        auto exists = false;
        for(const auto& model : n) {
          exists = exists || CheckAgainst(filt, model, true);
        }

        std::lock_guard<std::mutex> lock(mut);
        if(!exists && !done) {

          errs() << "(cyclic) Counterexample of length " << trace.size() << '\n';
          for(const auto& ev : trace) {
            errs() << "  " << ev->GraphViz() << '\n';
          }
          errs() << "May not satisfy assertion:\n  " << automaton->SourceCode() << "\n\n";

          done = true;
        }
      }
    }
  };

  auto threads = std::vector<std::thread>{};
  for(auto i = 0; i < n_cores; i++) {
    threads.push_back(std::thread(thread_worker));
  }
  std::for_each(std::begin(threads), std::end(threads), [](auto& t) { t.join(); });

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

bool ModelChecker::CheckAgainstFSM(const FiniteTraces::Trace &tr, const FiniteStateMachine<Expression *> fsm)
{
  auto start_state = fsm.InitialState();
  auto work_queue = std::stack<std::pair<decltype(start_state), size_t>>{};
  work_queue.push(std::make_pair(start_state, 0));

  auto visited = std::set<decltype(work_queue)::value_type>{};
  std::vector<Expression *> model{};
  
  while(!work_queue.empty()) {
    auto next = work_queue.top();
    work_queue.pop();

    if(model.size() > next.second) {
      model.resize(next.second);
    }

    if(visited.find(next) == visited.end()) {
      visited.insert(next);
    } else {
      continue;
    }

    if(next.first->accepting && next.second == tr.size()) {
      if(CheckReturnValues(tr, model)) {
        return true;
      }
    }

    if(next.second >= tr.size()) {
      continue;
    }

    for(const auto& edge : fsm.Edges(next.first)) {
      auto accepts = edge.Accepts<Event *>(tr[next.second], [=](auto ev, auto ex) { 
        return CheckState(*ex, ev, true); 
      });

      if(accepts) {
        work_queue.push(std::make_pair(edge.End(), next.second+1));
        model.push_back(edge.Value());
      }
    }
  }

  return false;
}

bool ModelChecker::CheckAgainst(const FiniteTraces::Trace &tr, const ModelGenerator::Model &mod, bool cycle) {
  auto no_asserts_checked = std::none_of(tr.begin(), tr.end(), 
    [=](auto e) {
      if(auto ae = dyn_cast<AssertEvent>(e)) {
        return std::any_of(mod.begin(), mod.end(), [=](auto as) { return CheckState(*as, ae); });
      }

      return false;
    }
  );
  if(no_asserts_checked) { return true; }

  if(!cycle) {
    if(tr.size() != mod.size()) {
      return false;
    }
  } else {
    if(tr.size() > mod.size()) {
      return false;
    }
  }

  auto match = true;
  for(auto i = 0; i < tr.size(); i++) {
    match = match && CheckState(*mod[i], tr[i]);
  }

  return match && CheckReturnValues(tr, mod);
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

bool ModelChecker::CheckReturnValues(const FiniteTraces::Trace &tr, const ModelGenerator::Model &mod) {
  assert(mod.size() >= tr.size() && "Can't do RVC if model shorter than trace");
  // How do we want to go about doing the checking in this part of the model
  // checker? the trace describes a vector of events, and the model gives a
  // vector of assertions. We only care about the assertions with an associated
  // return value, so we should first filter those out using the associate
  // protobuf information

  auto constraints = std::vector<BoolValue>{};
  for(auto i = 0; i < tr.size(); i++) {
    if(auto exe = dyn_cast<ExitEvent>(tr[i])) {
      if(exe->Call && hasReturnConstraint(mod[i])) {
        constraints.push_back(
            BoolValue{exe->Call, static_cast<bool>(getReturnConstraint(mod[i]))});
      }
    }
  }

  if(constraints.empty()) {
    return true;
  }

  auto occ = ConstraintsOccur(BBGraph, constraints);
  if(!occ) {
    return false;
  }

  for(auto i = 0; i < constraints.size() - 1; i++) {
    auto bigram = std::make_pair(constraints[i], constraints[i+1]);
    auto found = AssertionPairs.find(bigram);

    if(found == AssertionPairs.end()) {
      return false;
    }
  }

  return true;
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
  // TODO: check constant / any args better - bit of a hack at the moment
  //       it is definitely possible to check constant / any args, but this code
  //       currently just ignores them - may be incorrect on mixed args
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
