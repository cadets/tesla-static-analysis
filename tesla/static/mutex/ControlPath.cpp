#include "ControlPath.h"

#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/Casting.h>

#include <set>
#include <queue>

using std::set;
using std::queue;

set<Function *> tesla::CalledFunctions(Function *root) {
  queue<Function *> toVisit;
  toVisit.push(root);

  set<Function *> called;

  while(!toVisit.empty()) {
    Function *next = toVisit.front();
    toVisit.pop();
    called.insert(next);

    for(auto &BB : *next) {
      for(auto &I : BB) {
        if(isa<CallInst>(I)) {
          auto &call = cast<CallInst>(I);
          const auto fn = call.getCalledFunction();
          if(fn && !fn->isDeclaration()) {
            if(called.find(fn) == called.end()) {
              toVisit.push(fn);
            }
          }
        }
      }
    }
  }

  return called;
}
