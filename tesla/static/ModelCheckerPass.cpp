#include "ModelCheckerPass.h"

namespace tesla {

unique_ptr<Manifest> ModelCheckerPass::run(Manifest &Man, llvm::Module &Mo) {
  auto File = new ManifestFile();

  copyDefinitions(Man, File);
  for (auto root : Man.RootAutomata()) {
    auto automaton = Man.FindAutomatonSafe(root->identifier());
    if (!automaton) {
      panic("Usage without associated automaton");
    }

    Usage *newRoot = new Usage;
    newRoot->CopyFrom(*root);

    // model checking goes here

    copyUsage(newRoot, File);
  }

  auto unique = unique_ptr<ManifestFile>(File);
  return unique_ptr<Manifest>(Manifest::construct(
      llvm::errs(), Automaton::Deterministic, std::move(unique)));
}

const std::string ModelCheckerPass::PassName() const {
  return "ModelCheckerPass";
}

}
