#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Utils/Cloning.h>

#include "TraceFinder.h"

TraceFinder::trace_set_type TraceFinder::of_length(size_t n)
{
  const auto cached = [&](trace_set_type ret) {
    trace_cache_[n] = ret;
    return ret;
  };

  auto found = trace_cache_.find(n);
  if(found != trace_cache_.end()) {
    return found->second;
  }

  // No traces with 0 basic blocks.
  if(n == 0) {
    return cached({});
  }

  if(n == 1) {
    auto& entry_block = function_.getEntryBlock();
    const auto& trace = trace_type{std::make_pair(&entry_block, 0)};
    return cached({trace});
  }

  const auto& prefixes = of_length(n - 1);
  auto traces = trace_set_type{};

  for(const auto& prefix : prefixes) {
    auto last = prefix.back();
    auto term = last.first->getTerminator();

    for(auto i = 0; i < term->getNumSuccessors(); i++) {
      auto succ = term->getSuccessor(i);
      auto trace = prefix;
      trace.push_back(std::make_pair(succ, i));
      traces.insert(trace);
    }
  }

  return cached(traces);
}

TraceFinder::trace_set_type TraceFinder::of_length_up_to(size_t n)
{
  auto ret = trace_set_type{};
  for(size_t i = 0; i < n; i++) {
    auto traces = of_length(i);
    for(const auto& trace : traces) {
      ret.insert(trace);
    }
  }
  return ret;
}

bool TraceFinder::terminates(trace_type tr)
{
  return tr.back().first->getTerminator()->getNumSuccessors() == 0;
}

std::shared_ptr<Function> TraceFinder::from_trace(trace_type tr, ValueMap<Value *, std::string>& names) const
{
  if(!terminates(tr)) {
    return nullptr;
  }

  const auto fn_type = [&] {
    auto ty = function_.getType();

    if(auto ft = dyn_cast<FunctionType>(ty)) { 
      return ft; 
    }
    
    if(auto pt = dyn_cast<PointerType>(ty)) {
      if(auto ft = dyn_cast<FunctionType>(pt->getElementType())) {
        return ft;
      }
    }

    assert(false && "Can't get function type");
  }();

  auto trace_fn = Function::Create(fn_type, GlobalValue::ExternalLinkage, 
                                   "trace_" + function_.getName() + "_" + std::to_string(tr.size()));

  auto sink = BasicBlock::Create(function_.getContext(), "__tesla_sink", trace_fn);
  new UnreachableInst(function_.getContext(), sink);

  auto clones = std::vector<BasicBlock *>{};
  ValueToValueMapTy arg_map;
  for(auto i = 0; i < tr.size(); i++) {
    auto clone = CloneBasicBlock(tr[i].first, arg_map, "", trace_fn);
    clones.push_back(clone);
    for(auto &inst : *clone) {
      RemapInstruction(&inst, arg_map, RF_IgnoreMissingEntries);
    }
  }

  for(auto i = 0; i < clones.size(); i++) {
    auto clone = clones[i];
    auto term = clone->getTerminator();

    auto path = [&]() -> size_t {
      if(i == clones.size() - 1) { return 0; }
      else { return tr[i+1].second; }
    }();

    for(auto s = 0; s < term->getNumSuccessors(); s++) {
      auto replace = [&] {
        if(s == path || i == tr.size()) {
          return clones[i+1];
        } else {
          return sink;
        }
      }();
      term->setSuccessor(s, replace);
    }
  }

  sink->moveAfter(clones.back());

  int i = 0;
  for(auto& BB : *trace_fn) {
    for(auto& I : BB) {
      names.insert(std::make_pair(&I, "V" + std::to_string(i++)));
    }
  }

  return std::shared_ptr<Function>(trace_fn);
}

std::vector<const BasicBlock *> TraceFinder::linear_trace(const Function& func)
{
  auto sink = std::find_if(std::begin(func), std::end(func),
    [](auto& BB) { return BB.getName() == "__tesla_sink"; });

  auto trace = std::vector<const BasicBlock *>{};
  for(auto& BB : func) {
    if(&BB != sink) {
      trace.push_back(&BB);
    }
  }
  return trace;
}
