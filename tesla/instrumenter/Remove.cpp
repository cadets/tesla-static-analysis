#include "Names.h"
#include "Remove.h"

#include <llvm/IR/Module.h>
#include <llvm/Support/raw_ostream.h>

using namespace llvm;

namespace tesla {

char RemoveInstrumenter::ID = 0;

RemoveInstrumenter::~RemoveInstrumenter() {
  ::google::protobuf::ShutdownProtobufLibrary();
}

bool RemoveInstrumenter::runOnModule(Module &M) {
  auto to_delete = std::set<Instruction *>{};

  for(auto& F : M) {
    for(auto& BB : F) {
      for(auto& I : BB) {
        if(ShouldDelete(I)) {
          to_delete.insert(&I);
        }
      }
    }
  }

  for(auto I : to_delete) {
    I->eraseFromParent();
  }

  return true;
}

bool RemoveInstrumenter::ShouldDelete(llvm::Instruction &I) {
  if(auto ci = dyn_cast<CallInst>(&I)) {
    auto cf = ci->getCalledFunction();
    if(!cf) { return false; }

    auto name = cf->getName().str();
    if(has_prefix(name, TESLA_BASE)) {
      return true;
    }
  }

  return false;
}

}
