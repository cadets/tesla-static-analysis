#ifndef ACQUIRE_RELEASE_PASS_H
#define ACQUIRE_RELEASE_PASS_H

#include "ManifestPass.h"

using std::unique_ptr;
using std::set;

namespace tesla {

class AcquireReleasePass : public ManifestPass {
  public:
    virtual unique_ptr<Manifest> run(Manifest &Ma, llvm::Module &Mo) override;
    virtual const std::string PassName() const override;
  private:
    static const std::string AutomatonName();
    static bool UsesAcqRel(const Usage *usage, set<const Location> &locs);
    static bool ReferencesAcqRel(const AutomatonDescription *aut);
    static set<const Location> ReferenceLocations(Manifest &Man);
};

}

#endif
