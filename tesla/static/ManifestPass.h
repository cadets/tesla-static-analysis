#ifndef MANIFEST_PASS_H
#define MANIFEST_PASS_H

#include "Manifest.h"

#include <llvm/IR/Module.h>

using std::unique_ptr;

namespace tesla {

class ManifestPass {
  public:
    virtual unique_ptr<Manifest> run(Manifest &Ma, llvm::Module &Mo) = 0;
    virtual const std::string PassName() const = 0;
    const std::string Error(std::string message) const;
    const std::string Debug(std::string message) const;
  protected:
    void copyDefinitions(Manifest &Ma, ManifestFile *file) const;
  private:
    const std::string PrefixMessage(std::string prefix, std::string message) const;
};

}

#endif
