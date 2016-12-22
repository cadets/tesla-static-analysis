#include "AcquireReleasePass.h"

#include <llvm/Support/raw_ostream.h>

using std::unique_ptr;

namespace tesla {

unique_ptr<Manifest> AcquireReleasePass::run(Manifest &Man, llvm::Module &Mod) {
  if(!UsesAcqRel(Man)) {
    llvm::errs() << "Manifest does not contain the acq_rel automaton\n";
    return nullptr;
  }

  return nullptr;
}

bool AcquireReleasePass::UsesAcqRel(Manifest &Man) {
  for(auto entry : Man.AllAutomata()) {
    if(entry.first.name() == AutomatonName()) {
      return true;
    }
  }

  return false;
}

const std::string AcquireReleasePass::AutomatonName() {
  return "acq_rel";
}

}
