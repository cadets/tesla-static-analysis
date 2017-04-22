#include <llvm/IR/Instructions.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Utils/Cloning.h>

#include "trace_finder.h"

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
    const auto& trace = trace_type{std::make_pair(std::shared_ptr<BasicBlock>(&entry_block),0)};
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
      trace.push_back(std::make_pair(std::shared_ptr<BasicBlock>(succ), i));
      traces.insert(trace);
    }
  }

  return cached(traces);
}

bool TraceFinder::terminates(trace_type tr)
{
  return tr.back().first->getTerminator()->getNumSuccessors() == 0;
}

std::shared_ptr<Function> TraceFinder::from_trace(trace_type tr) const
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
  /*auto to_it = trace_fn->arg_begin();
  for(auto from_it = function_.arg_begin();
      to_it != trace_fn->arg_end() && from_it != function_.arg_end();
      to_it++, from_it++) {
    arg_map[from_it] = to_it;
  }*/

  auto sink = BasicBlock::Create(function_.getContext(), "sink", trace_fn);
  new UnreachableInst(function_.getContext(), sink);

  auto clones = std::vector<BasicBlock *>{};
  for(auto i = 0; i < tr.size(); i++) {
    ValueToValueMapTy arg_map;
    auto clone = CloneBasicBlock(tr[i].first.get(), arg_map, "tr", trace_fn);
    for(auto &inst : *clone) {
      RemapInstruction(&inst, arg_map, RF_NoModuleLevelChanges | RF_IgnoreMissingEntries);
    }
    clones.push_back(clone);
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
  return std::shared_ptr<Function>(trace_fn);
}
