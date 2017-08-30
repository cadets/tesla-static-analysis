#include "Assertion.h"
#include "Callee.h"
#include "Caller.h"
#include "Debug.h"
#include "FieldReference.h"
#include "Manifest.h"
#include "Remove.h"

#include <llvm/Pass.h>
#include <llvm/Analysis/TargetLibraryInfo.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/Support/raw_ostream.h>

using namespace llvm;

namespace {

static cl::opt<bool>
SuppressDI("suppress-debug-instrumentation",
    cl::desc("Suppress the generation of debug output in instrumentation"));

struct InstrumentPass : public ModulePass {
  static char ID;
  InstrumentPass() : ModulePass(ID) {}

  virtual bool runOnModule(Module& M) override;
};

bool InstrumentPass::runOnModule(Module& M)
{
  std::unique_ptr<tesla::Manifest> Manifest(tesla::Manifest::load(llvm::errs()));
  if (!Manifest) {
    tesla::panic("unable to load TESLA manifest");
  }

  legacy::PassManager Passes;

  // Add an appropriate TargetLibraryInfo pass for the module's triple.
  auto TLI = new TargetLibraryInfoWrapperPass(Triple(M.getTargetTriple()));
  Passes.add(TLI);

  if(Manifest->HasInstrumentation()) {
    Passes.add(new tesla::AssertionSiteInstrumenter(*Manifest, SuppressDI));
    Passes.add(new tesla::FnCalleeInstrumenter(*Manifest, SuppressDI));
    Passes.add(new tesla::FnCallerInstrumenter(*Manifest, SuppressDI));
    Passes.add(new tesla::FieldReferenceInstrumenter(*Manifest, SuppressDI));
  } else {
    Passes.add(new tesla::RemoveInstrumenter(*Manifest, SuppressDI));
  }

  Passes.run(M);
  return true;
}

char InstrumentPass::ID = 0;
static RegisterPass<InstrumentPass> X("tesla-instrument", "Instrument IR with TESLA");

}
