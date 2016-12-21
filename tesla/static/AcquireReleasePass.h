#ifndef ACQUIRE_RELEASE_PASS_H
#define ACQUIRE_RELEASE_PASS_H

#include "ManifestPass.h"

namespace tesla {

class AcquireReleasePass : public ManifestPass {
  virtual void run(Manifest &Ma, llvm::Module &Mo) override;
};

}

#endif
