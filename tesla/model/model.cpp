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

  for(auto &F : *Mod) {
    if(F.isDeclaration()) continue;

    auto eg = EventGraph::InstructionGraph(&F);

    errs() << F.getName().str() << '\n';

    eg->transform(
      [=](Event *e) -> Event * { 
        if(auto ie = dyn_cast<InstructionEvent>(e)) {
          if(auto ci = dyn_cast<CallInst>(ie->Instr())) {
            return new CallEvent(ci);
          }
        }

        return new EmptyEvent;
      }
    );

    errs() << eg->GraphViz();
  }

  return 0;
}
