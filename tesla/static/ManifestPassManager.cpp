#include "ManifestPassManager.h"

#include <llvm/Support/raw_ostream.h>

using std::unique_ptr;

namespace tesla {

ManifestPassManager::ManifestPassManager(unique_ptr<tesla::Manifest> Ma, 
                                         unique_ptr<llvm::Module> Mo) :
  Manifest(std::move(Ma)), Mod(std::move(Mo)) {}

void ManifestPassManager::addPass(ManifestPass *pass) {
  passes.push_back(pass);
}

unique_ptr<tesla::Manifest> ManifestPassManager::runPasses() {
  auto result = std::move(Manifest);

  for(auto pass : passes) {
    result = pass->run(*result, *Mod);
    if(!result) {
      llvm::errs() << "Pass failed: "
                   << pass->PassName() << '\n';
      break;
    }
  }

  return result;
}

}
