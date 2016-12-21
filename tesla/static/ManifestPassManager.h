#ifndef MANIFEST_PASS_MANAGER_H
#define MANIFEST_PASS_MANAGER_H

#include "ManifestPass.h"

#include <vector>

#include <llvm/IR/Module.h>

using std::vector;

namespace tesla {

class ManifestPassManager {
  public:
    ManifestPassManager(const shared_ptr<Manifest> &Ma, const shared_ptr<llvm::Module> &Mo);
    void addPass(ManifestPass *pass);
    void runPasses();
  private:
    vector<ManifestPass *> passes;
    shared_ptr<tesla::Manifest> Manifest;
    shared_ptr<llvm::Module> Mod;
};

}

#endif
