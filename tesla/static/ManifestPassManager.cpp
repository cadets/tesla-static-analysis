#include "ManifestPassManager.h"

namespace tesla {

ManifestPassManager::ManifestPassManager(const shared_ptr<tesla::Manifest> &Ma, 
                                         const shared_ptr<llvm::Module> &Mo) :
  Manifest(Ma), Mod(Mo) {}

void ManifestPassManager::addPass(ManifestPass *pass) {
  passes.push_back(pass);
}

void ManifestPassManager::runPasses() {
  for(auto pass : passes) {
    pass->run(Manifest, Mod);
  }
}

}
