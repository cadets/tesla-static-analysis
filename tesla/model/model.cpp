#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/SourceMgr.h>

#include <map>
#include <queue>

#include "Debug.h"
#include "EventGraph.h"
#include "FiniteTraces.h"
#include "GraphTransforms.h"
#include "Manifest.h"
#include "ModelChecker.h"

using std::map;
using std::queue;
using namespace llvm;

static cl::opt<std::string>
BitcodeFilename(cl::Positional, cl::desc("<bitcode>"), cl::Required);

static cl::opt<std::string>
ManifestFilename(cl::Positional, cl::desc("<manifest>"), cl::Required);

static cl::opt<std::string>
FunctionName("entry", cl::desc("[entry point]"), cl::init("main"));

static cl::opt<int>
UnrollDepth("unroll", cl::desc("[unroll depth]"), cl::init(64));

static cl::opt<int>
FMCBound("bound", cl::desc("[FMC length bound]"), cl::init(100));

int main(int argc, char **argv) {
  SMDiagnostic Err;
  LLVMContext &Context = getGlobalContext();

  cl::ParseCommandLineOptions(argc, argv, "TESLA IR Model Builder\n");

  std::unique_ptr<Module> Mod(ParseIRFile(BitcodeFilename, Err, Context));
  if(Mod.get() == nullptr) {
    Err.print(argv[0], errs());
    return 1;
  }

  std::unique_ptr<tesla::Manifest> Manifest(tesla::Manifest::load(
    llvm::errs(), tesla::Automaton::Deterministic, ManifestFilename));
  if(!Manifest) {
    tesla::panic("unable to load TESLA manifest");
  }

  auto fn = Mod->getFunction(FunctionName);
  if(!fn) {
    errs() << "No function named " << FunctionName << " in module " << BitcodeFilename << '\n';
    return 2;
  }

  auto eg = EventGraph::ModuleGraph(Mod.get(), fn, UnrollDepth);

  auto mc = ModelChecker(eg, Mod.get(), Manifest.get(), fn, FMCBound);
  for(auto safe : mc.SafeUsages()) {
    errs() << "safe: " << tesla::ShortName(safe->identifier()) << '\n';
  }
  
  return 0;
}
