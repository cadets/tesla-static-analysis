#include "AcquireReleasePass.h"

#include "Debug.h"

#include <llvm/Support/raw_ostream.h>

using std::unique_ptr;
using std::set;

namespace tesla {

unique_ptr<Manifest> AcquireReleasePass::run(Manifest &Man, llvm::Module &Mod) {
  auto File = new ManifestFile();

  copyDefinitions(Man, File);

  auto locs = ReferenceLocations(Man);
  for(auto root : Man.RootAutomata()) {
    copyUsage(root, File);
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
  auto expr = aut->expression();

  if(expr.type() != Expression_Type_SEQUENCE) {
    return false;
  }

  if(!expr.has_sequence()) {
    tesla::panic("Expression has type SEQUENCE but no sequence data");
  }

  auto seq = expr.sequence().expression();
  for(auto it = seq.begin(); it != seq.end(); it++) {
    if(it->type() == Expression_Type_NULL_EXPR) {
      continue;
    }

    if(it->type() == Expression_Type_ASSERTION_SITE) {
      it++;
      if(it != seq.end() && it->type() == Expression_Type_SUB_AUTOMATON) {
        if(it->subautomaton().name() == AutomatonName()) {
          return true;
        }
      }
    }
  }

  return false;
}

set<const Location> AcquireReleasePass::ReferenceLocations(Manifest &Man) {
  auto ret = set<const Location>();

  for(auto entry : Man.AllAutomata()) {
    if(ReferencesAcqRel(entry.second)) {
      ret.insert(entry.first.location());
    }
  }

  return ret;
}

const std::string AcquireReleasePass::PassName() const {
  return "AcquireRelease";
}

const std::string AcquireReleasePass::AutomatonName() {
  return "acq_rel";
}

}
