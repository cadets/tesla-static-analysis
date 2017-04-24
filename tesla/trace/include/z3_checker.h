#ifndef Z3_CHECKER_H
#define Z3_CHECKER_H

#include <llvm/IR/Function.h>
#include <llvm/IR/Module.h>

#include "Manifest.h"
#include "tesla.pb.h"

using namespace llvm;

class Z3Checker {
public:
  Z3Checker(tesla::Manifest &man, Module &mo) :
    manifest_(man), module_(mo) {}

  bool check_usage(const tesla::Usage *use);
private:
  tesla::Manifest& manifest_;
  Module& module_;

  bool has_checkable_bounds(const tesla::Usage *use) const;
  Function *bound_function(const tesla::Usage *use) const;
};

#endif
