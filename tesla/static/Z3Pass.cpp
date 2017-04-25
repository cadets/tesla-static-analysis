#include "z3_checker.h"
#include "Z3Pass.h"

namespace tesla {

unique_ptr<Manifest> Z3Pass::run(Manifest &Man, llvm::Module &Mo) {
  auto File = new ManifestFile();

  copyDefinitions(Man, File);
  for (auto root : Man.RootAutomata()) {
    auto automaton = Man.FindAutomatonSafe(root->identifier());
    if (!automaton) {
      panic("Usage without associated automaton");
    }

    Usage *newRoot = new Usage;
    newRoot->CopyFrom(*root);

    newRoot->set_deleted(CheckUsage(Man, Mo, newRoot));

    copyUsage(newRoot, File);
  }

  auto unique = unique_ptr<ManifestFile>(File);
  return unique_ptr<Manifest>(Manifest::construct(
      llvm::errs(), Automaton::Deterministic, std::move(unique)));
}
  
bool Z3Pass::CheckUsage(Manifest &Man, llvm::Module &Mo, const Usage *use) {
  return Z3Checker{Man, Mo}.check_usage(use, UnrollDepth, TraceBound);
}

const std::string Z3Pass::PassName() const {
  return "Z3Pass";
}

}
