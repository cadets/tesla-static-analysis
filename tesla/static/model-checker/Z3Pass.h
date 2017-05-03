#ifndef Z3_PASS_H
#define Z3_PASS_H

#include <set>

#include <llvm/Support/raw_ostream.h>

#include "Debug.h"
#include "../ManifestPass.h"
#include "ModelChecker.h"

using std::unique_ptr;
using std::set;
using namespace llvm;

namespace tesla {

class Z3Pass: public ManifestPass {
  public:
    Z3Pass(size_t unroll, size_t trace) :
      inline_depth_(unroll), bmc_bound_(trace) {}

    virtual unique_ptr<Manifest> run(Manifest &Ma, Module &Mo) override;
    virtual const std::string PassName() const override;
  private:
    size_t inline_depth_;
    size_t bmc_bound_;
    bool CheckUsage(Manifest &Man, Module &Mo, const Usage *use);

    bool has_checkable_bounds(const tesla::Usage *use) const;
    Function *bound_function(Module& mod, const tesla::Usage *use) const;

    set<Function *> inlined_functions_;
};

}

#endif
