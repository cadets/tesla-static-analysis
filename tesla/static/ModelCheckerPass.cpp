#include "EventGraph.h"
#include "ModelChecker.h"
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

    newRoot->set_deleted(CheckUsage(Man, Mo, newRoot));

    copyUsage(newRoot, File);
  }

  auto unique = unique_ptr<ManifestFile>(File);
  return unique_ptr<Manifest>(Manifest::construct(
      llvm::errs(), Automaton::Deterministic, std::move(unique)));
}
  
bool ModelCheckerPass::CheckUsage(Manifest &Man, llvm::Module &Mo, const Usage *use) {
  // TODO: check this for the end, correct types etc
  auto funcName = use->beginning().function().function().name();
  auto fn = Mo.getFunction(funcName);

  auto eg = EventGraph::ModuleGraph(&Mo, fn, UnrollDepth);
  auto mc = ModelChecker(eg, &Mo, &Man, fn, TraceBound);
  return mc.IsUsageSafe(use);
}

const std::string ModelCheckerPass::PassName() const {
  return "ModelCheckerPass";
}

}
