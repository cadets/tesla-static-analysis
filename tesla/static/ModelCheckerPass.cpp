#include "ModelCheckerPass.h"

namespace tesla {

unique_ptr<Manifest> ModelCheckerPass::run(Manifest &Ma, llvm::Module &Mo) {
  return nullptr;
}

const std::string ModelCheckerPass::PassName() const {
  return "ModelCheckerPass";
}

}
