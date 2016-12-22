#ifndef MANIFEST_PASS_MANAGER_H
#define MANIFEST_PASS_MANAGER_H

#include "ManifestPass.h"

#include <vector>

#include <llvm/IR/Module.h>

using std::vector;
using std::unique_ptr;

namespace tesla {

class ManifestPassManager {
  public:
    ManifestPassManager(unique_ptr<Manifest> Ma, unique_ptr<llvm::Module> Mo);
    void addPass(ManifestPass *pass);
    unique_ptr<tesla::Manifest> runPasses();
  private:
    vector<ManifestPass *> passes;
    unique_ptr<tesla::Manifest> Manifest;
    unique_ptr<llvm::Module> Mod;
};

}

#endif
