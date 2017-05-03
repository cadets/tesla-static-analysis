#include "MissingCallAnalysis.h"

bool MissingCallAnalysis::run() {
  auto calls = CG.TransitiveCalls(&Bound);
  auto acqFn = Mod.getFunction("lock_acquire");
  auto relFn = Mod.getFunction("lock_release");
  bool missing = false;
  
  if(std::find(calls.begin(), calls.end(), acqFn) == calls.end()) {
    AddMessage("No call to lock_acquire found");
    missing = true;
  }

  if(std::find(calls.begin(), calls.end(), relFn) == calls.end()) {
    AddMessage("No call to lock_release found");
    missing = true;
  }

  return missing;
}
