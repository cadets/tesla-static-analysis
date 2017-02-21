#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/SourceMgr.h>

#include <map>
#include <queue>

#include "EventGraph.h"
#include "GraphTransforms.h"

using std::map;
using std::queue;
using namespace llvm;

static cl::opt<std::string>
BitcodeFilename(cl::Positional, cl::desc("<bitcode>"), cl::Required);

static cl::opt<std::string>
FunctionName(cl::Positional, cl::desc("<function>"), cl::Required);

static cl::opt<int>
UnrollDepth(cl::Positional, cl::desc("[unroll depth]"), cl::init(10));

int main(int argc, char **argv) {
  SMDiagnostic Err;
  LLVMContext &Context = getGlobalContext();

  cl::ParseCommandLineOptions(argc, argv, "TESLA IR Model Builder\n");

  std::unique_ptr<Module> Mod(ParseIRFile(BitcodeFilename, Err, Context));
  if(Mod.get() == nullptr) {
    Err.print(argv[0], errs());
    return 1;
  }

  auto fn = Mod->getFunction(FunctionName);
  if(!fn) {
    errs() << "No function named " << FunctionName << " in module " << BitcodeFilename << '\n';
    return 2;
  }

  auto eg = EventGraph::ModuleGraph(Mod.get(), fn, UnrollDepth);
  errs() << eg->GraphViz();

  return 0;
}
