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

#include "inline_all_pass.h"
#include "smt_text_gen.h"
#include "stub_functions_pass.h"
#include "trace_finder.h"
#include "z3_solve.h"

using namespace llvm;

static cl::opt<std::string>
BitcodeFilename(cl::Positional, cl::desc("bitcode"), cl::Required);

static cl::opt<std::string>
FunctionName("f", cl::desc("function"), cl::init("main"));

static cl::opt<bool>
SMT2TextOutput("smt2", cl::desc("output SMT2 textual form"), cl::init(false));

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
  Passes.add(new StubFunctionsPass);
  //Passes.add(createInstructionCombiningPass());
  //Passes.add(createDeadCodeEliminationPass());
  Passes.run(*mod);

  auto function = mod->getFunction(FunctionName);
  if(function == nullptr) {
    errs() << "No function named: " << FunctionName << " in module\n";
    return 2;
  }

  auto&& inliner = InlineAllPass(64);
  inliner.runOnFunction(*function);

  auto finder = TraceFinder(*function);
  auto trs = finder.of_length_up_to(10);
  for(const auto& trace : trs) {
    auto&& names = ValueMap<Value *, std::string>{};
    if(auto tr_fn = finder.from_trace(trace, names)) {
      //tr_fn->dump();

      if(SMT2TextOutput) {
        auto gen = SMTTextVisitor(*tr_fn, names); 
        gen.run();
        outs() << gen.str() << '\n';
      } else {
        auto&& z3 = Z3Visitor(*tr_fn, names);
        z3.run();
      }
    }
  }
  return 0;
}
