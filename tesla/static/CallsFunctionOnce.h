#ifndef CALLS_FUNCTION_ONCE_H
#define CALLS_FUNCTION_ONCE_H

#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>

#include <set>

using std::set;
using namespace llvm;

namespace tesla {

bool CallsFunctionOnce(Function *callee, Function *caller);
set<ReturnInst *> FunctionExits(Function *f);
set<CallInst *> CallsTo(Function *callee, Function *caller);

}

#endif
