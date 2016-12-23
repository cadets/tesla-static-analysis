#include "AcquireReleasePass.h"

#include <llvm/Support/raw_ostream.h>

using std::unique_ptr;
using std::set;

namespace tesla {

unique_ptr<Manifest> AcquireReleasePass::run(Manifest &Man, llvm::Module &Mod) {
  auto File = new ManifestFile();

  copyDefinitions(Man, File);

  auto locs = ReferenceLocations(Man);
  for(auto root : Man.RootAutomata()) {
    if(!UsesAcqRel(root, locs)) {
      copyUsage(root, File);
    }
  }

  auto unique = unique_ptr<ManifestFile>(File);
  return unique_ptr<Manifest>(
      Manifest::construct(llvm::errs(), Automaton::Deterministic, std::move(unique)));
}

bool AcquireReleasePass::UsesAcqRel(const Usage *usage, set<const Location> &locs) {
  if(usage->identifier().has_location()) {
    if(locs.find(usage->identifier().location()) != locs.end()) {
      return true;
    }
  }

  return false;
}

bool AcquireReleasePass::ReferencesAcqRel(const AutomatonDescription *aut) {
  return false;
}

set<const Location> AcquireReleasePass::ReferenceLocations(Manifest &Man) {
  return set<const Location>();
}

const std::string AcquireReleasePass::PassName() const {
  return "AcquireRelease";
}

const std::string AcquireReleasePass::AutomatonName() {
  return "acq_rel";
}

}
