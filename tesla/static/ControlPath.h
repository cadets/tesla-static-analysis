#ifndef CONTROL_PATH_H
#define CONTROL_PATH_H

#include <llvm/IR/Function.h>

#include <set>

using namespace llvm;

namespace tesla {

std::set<Function *> CalledFunctions(Function *root);

}

#endif
