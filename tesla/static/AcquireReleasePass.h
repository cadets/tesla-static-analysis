#ifndef ACQUIRE_RELEASE_PASS_H
#define ACQUIRE_RELEASE_PASS_H

#include "ManifestPass.h"

using std::unique_ptr;

namespace tesla {

class AcquireReleasePass : public ManifestPass {
  public:
    virtual unique_ptr<Manifest> run(Manifest &Ma, llvm::Module &Mo) override;
    virtual const std::string PassName() const override;
  private:
    static const std::string AutomatonName();
};

}

#endif
