#include "AddressTakenAnalysis.h"
#include "Debug.h"

#include <llvm/IR/Instructions.h>

using namespace llvm;

bool AddressTakenAnalysis::run() {
  auto acqFn = Mod.getFunction("lock_acquire");
  auto relFn = Mod.getFunction("lock_release");

  for(auto &F : Mod) {
    for(auto &BB : F) {
      for(auto &I : BB) {
        if(isa<StoreInst>(I)) {
          auto &store = cast<StoreInst>(I);
          if(store.getValueOperand() == acqFn ||
             store.getValueOperand() == relFn) {
            AddMessage("Address of lock function has been taken");
            AddMessage("Taken at: " + tesla::DebugLocationString(&store));
            return true;
          }
        }
      }
    }
  }

  return false;
}
