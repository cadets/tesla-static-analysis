#include "CallSequencePass.h"

#include <llvm/Support/raw_ostream.h>

namespace tesla {
    
unique_ptr<Manifest> CallSequencePass::run(Manifest &Man, llvm::Module &Mo) {
  auto File = new ManifestFile();

  copyDefinitions(Man, File);
  for (auto root : Man.RootAutomata()) {
    copyUsage(root, File);
  }

  auto unique = unique_ptr<ManifestFile>(File);
  return unique_ptr<Manifest>(Manifest::construct(
      llvm::errs(), Automaton::Deterministic, std::move(unique)));
};

}
