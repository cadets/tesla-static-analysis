#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/SourceMgr.h>

#include <map>
#include <queue>

#include "EventGraph.h"

using std::map;
using std::queue;
using namespace llvm;

static cl::opt<std::string>
BitcodeFilename(cl::Positional, cl::desc("bitcode"), cl::Required);

int main(int argc, char **argv) {
  SMDiagnostic Err;
  LLVMContext &Context = getGlobalContext();

  cl::ParseCommandLineOptions(argc, argv, "TESLA IR Model Builder\n");

  std::unique_ptr<Module> Mod(ParseIRFile(BitcodeFilename, Err, Context));
  if(Mod.get() == nullptr) {
    Err.print(argv[0], errs());
    return 1;
  }

  errs() << "digraph {\n";
  for(auto &F : *Mod) {
    if(!F.isDeclaration()) {
      auto eg = EventGraph{&F};
      eg.Simplify();
      errs() << eg.GraphViz();
    }
  }
  errs() << "}\n";
  
  return 0;
}