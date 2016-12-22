#include "AcquireReleasePass.h"

#include <llvm/Support/raw_ostream.h>

using std::unique_ptr;

namespace tesla {

unique_ptr<Manifest> AcquireReleasePass::run(Manifest &Man, llvm::Module &Mod) {
  auto File = new ManifestFile();

  copyDefinitions(Man, File);

  for(auto root : Man.RootAutomata()) {
    if(!UsesAcqRel(root)) {
      copyUsage(root, File);
    }
  }

  auto unique = unique_ptr<ManifestFile>(File);
  return unique_ptr<Manifest>(
      Manifest::construct(llvm::errs(), Automaton::Deterministic, std::move(unique)));
}

bool AcquireReleasePass::UsesAcqRel(const Usage *usage) {
  return false;
}

const std::string AcquireReleasePass::PassName() const {
  return "AcquireRelease";
}

const std::string AcquireReleasePass::AutomatonName() {
  return "acq_rel";
}

}
