#ifndef MANIFEST_PASS_H
#define MANIFEST_PASS_H

#include "Manifest.h"

#include <llvm/IR/Module.h>

using std::shared_ptr;

namespace tesla {

class ManifestPass {
  public:
    virtual void run(const shared_ptr<Manifest> &Ma, const shared_ptr<llvm::Module> &Mo) = 0;
};

}

#endif
