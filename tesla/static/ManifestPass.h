#ifndef MANIFEST_PASS_H
#define MANIFEST_PASS_H

#include "Manifest.h"

#include <llvm/IR/Module.h>

using std::unique_ptr;

namespace tesla {

class ManifestPass {
  public:
    virtual unique_ptr<Manifest> run(Manifest &Ma, llvm::Module &Mo) = 0;
};

}

#endif
