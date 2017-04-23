#include <llvm/ADT/ValueMap.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/ManagedStatic.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Transforms/Scalar.h>
#include <llvm/PassManager.h>

#include "smt_gen.h"
#include "trace_finder.h"

using namespace llvm;

static cl::opt<std::string>
BitcodeFilename(cl::Positional, cl::desc("bitcode"), cl::Required);

static cl::opt<std::string>
FunctionName("f", cl::desc("function"), cl::init("main"));

int main(int argc, char **argv)
{
  cl::ParseCommandLineOptions(argc, argv, "TESLA Function Tracer\n");
  LLVMContext &Context = getGlobalContext();

  SMDiagnostic Err;
  auto mod = std::unique_ptr<Module>(ParseIRFile(BitcodeFilename, Err, Context));
  if(mod.get() == nullptr) {
    Err.print(argv[0], errs());
    return 1;
  }

  PassManager Passes;
  Passes.add(createPromoteMemoryToRegisterPass());
  //Passes.add(createInstructionCombiningPass());
  //Passes.add(createDeadCodeEliminationPass());
  Passes.run(*mod);

  auto function = mod->getFunction(FunctionName);
  if(function == nullptr) {
    errs() << "No function named: " << FunctionName << " in module\n";
    return 2;
  }

  auto finder = TraceFinder(*function);
  auto trs = finder.of_length_up_to(15);
  for(const auto& trace : trs) {
    auto&& names = ValueMap<Value *, std::string>{};
    if(auto tr_fn = finder.from_trace(trace, names)) {
      tr_fn->dump();

      auto gen = SMTVisitor(*tr_fn, names); 
      gen.run();
      gen.check();
      outs() << gen.str() << '\n';
    }
  }
  return 0;
}
