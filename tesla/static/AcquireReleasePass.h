#ifndef ACQUIRE_RELEASE_PASS_H
#define ACQUIRE_RELEASE_PASS_H

#include "ManifestPass.h"

namespace tesla {

class AcquireReleasePass : public ManifestPass {
  public:
    virtual void run(Manifest &Ma, llvm::Module &Mo) override;
  private:
    static bool UsesAcqRel(Manifest &Ma);
    static const std::string AutomatonName();
};

}

#endif
