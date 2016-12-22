#include "Debug.h"
#include "Manifest.h"
#include "ManifestPassManager.h"
#include "AcquireReleasePass.h"

#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/ManagedStatic.h>
#include <llvm/Support/PrettyStackTrace.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/SourceMgr.h>

using namespace llvm;

static cl::opt<std::string>
ManifestFilename(cl::Positional, cl::desc("manifest"), cl::Required);

static cl::opt<std::string>
BitcodeFilename(cl::Positional, cl::desc("bitcode"), cl::Required);

int main(int argc, char **argv) {
  PrettyStackTraceProgram X(argc, argv);
  llvm_shutdown_obj Y;
  LLVMContext &Context = getGlobalContext();

  cl::ParseCommandLineOptions(argc, argv, "TESLA Static Analyser\n");

  SMDiagnostic Err;
  
  std::unique_ptr<tesla::Manifest> Manifest(tesla::Manifest::load(
    llvm::errs(), tesla::Automaton::Deterministic, ManifestFilename));
  if(!Manifest) {
    tesla::panic("unable to load TESLA manifest");
  }

  std::unique_ptr<Module> Mod(ParseIRFile(BitcodeFilename, Err, Context));
  if(Mod.get() == nullptr) {
    Err.print(argv[0], errs());
    return 1;
  }

  tesla::ManifestPassManager PM(std::move(Manifest), std::move(Mod));
  PM.addPass(new tesla::AcquireReleasePass);

  PM.runPasses();

  return 0;
}
