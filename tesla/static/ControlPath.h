#ifndef CONTROL_PATH_H
#define CONTROL_PATH_H

#include <llvm/IR/Function.h>

#include <vector>

using namespace llvm;

namespace tesla {

std::vector<Function *> CalledFunctions(Function *root);

}

#endif
