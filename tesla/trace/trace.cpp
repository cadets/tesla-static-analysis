#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/ManagedStatic.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/SourceMgr.h>

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

  auto function = std::shared_ptr<Function>(mod->getFunction(FunctionName));
  if(function.get() == nullptr) {
    errs() << "No function named: " << FunctionName << " in module\n";
    return 2;
  }

  function->dump();
  return 0;
}
