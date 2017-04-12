#include "CallSequencePass.h"
#include "CallsFunctionOnce.h"

#include <llvm/Support/raw_ostream.h>

namespace tesla {
    
unique_ptr<Manifest> CallSequencePass::run(Manifest &Man, llvm::Module &Mo) {
  auto File = new ManifestFile();

  auto f = Mo.getFunction("f");
  if(f) {
    auto tcs = TransitiveCallsOnce(Mo, f);
    for(auto fn : tcs) {
      llvm::errs() << fn->getName().str() << '\n';
    }
  }

  copyDefinitions(Man, File);
  for (auto root : Man.RootAutomata()) {
    copyUsage(root, File);
  }

  auto unique = unique_ptr<ManifestFile>(File);
  return unique_ptr<Manifest>(Manifest::construct(
      llvm::errs(), Automaton::Deterministic, std::move(unique)));
};

}
