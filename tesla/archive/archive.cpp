#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/SourceMgr.h>

using namespace llvm;

static cl::opt<std::string>
BitcodeFilename(cl::Positional, cl::desc("<bitcode>"), cl::Required);

static cl::opt<std::string>
ManifestFilename(cl::Positional, cl::desc("<manifest>"), cl::Required);

int main(int argc, char **argv)
{
  SMDiagnostic Err;
  LLVMContext &Context = getGlobalContext();

  cl::ParseCommandLineOptions(argc, argv, "TESLA Archive Utility\n");
  return 0;
}
