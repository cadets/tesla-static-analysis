#ifndef CALL_SEQUENCE_PASS_H
#define CALL_SEQUENCE_PASS_H

#include "ManifestPass.h"

namespace tesla {

class CallSequencePass : public ManifestPass {
  public:
    virtual unique_ptr<Manifest> run(Manifest &Ma, llvm::Module &Mo) override;
    virtual const std::string PassName() const override { return "CallSequence"; }
};

}

#endif
