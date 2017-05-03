#ifndef TRACE_FINDER_H
#define TRACE_FINDER_H

#include <functional>
#include <map>
#include <set>
#include <vector>

#include <llvm/ADT/ValueMap.h>
#include <llvm/IR/Function.h>

using namespace llvm;

class TraceFinder {
public:
  using trace_element_type = std::pair<BasicBlock *, size_t>;
  using trace_type = std::vector<trace_element_type>;
  using trace_set_type = std::set<trace_type>;

  TraceFinder(Function& f) :
    function_(f) {}

  const Function& function() const { return function_; }

  trace_set_type of_length(size_t n);
  trace_set_type of_length_up_to(size_t n);

  static bool terminates(trace_type tr);
  std::shared_ptr<Function> from_trace(trace_type tr, ValueMap<Value *, std::string>& names) const;

  static std::vector<const BasicBlock *> linear_trace(const Function& func);
private:
  Function& function_;
  std::map<size_t, trace_set_type> trace_cache_;
};

#endif
