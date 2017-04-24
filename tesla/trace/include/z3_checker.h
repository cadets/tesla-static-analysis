#ifndef Z3_CHECKER_H
#define Z3_CHECKER_H

#include <llvm/IR/Module.h>

#include "Manifest.h"
#include "tesla.pb.h"

class Z3Checker {
public:
  Z3Checker(tesla::Manifest &man, llvm::Module &mo) :
    manifest_(man), module_(mo) {}

  bool check_usage(const tesla::Usage *use);
private:
  tesla::Manifest& manifest_;
  llvm::Module& module_;
};

#endif
