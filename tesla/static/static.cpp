#include "AcquireReleasePass.h"
#include "CallSequencePass.h"
#include "ModelCheckerPass.h"
#include "Debug.h"
#include "Manifest.h"
#include "ManifestPassManager.h"
#include "tesla.pb.h"

#include "ModelChecker.h"

#include <google/protobuf/text_format.h>

#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/ManagedStatic.h>
#include <llvm/Support/PrettyStackTrace.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/SourceMgr.h>

using namespace llvm;
using std::string;

static cl::opt<std::string>
ManifestFilename(cl::Positional, cl::desc("manifest"), cl::Required);

static cl::opt<std::string>
BitcodeFilename(cl::Positional, cl::desc("bitcode"), cl::Required);

static cl::OptionCategory PassCat("Pass selection flags",
                                  "These flags control which manifest passes are run");

static cl::opt<bool>
EnableAcqRelPass("acqrel", cl::desc("Run hand-coded acquire-release pass"),
                 cl::init(false), cl::cat(PassCat));

static cl::opt<bool>
EnableCallSeqPass("callseq", cl::desc("Run obsolete call sequence pass"),
                  cl::init(false), cl::cat(PassCat));

static cl::opt<bool>
EnableModelChecker("modelcheck", cl::desc("Run model checker pass"),
                   cl::init(false), cl::cat(PassCat));

static cl::opt<std::string>
OutputFilename("o", cl::desc("Specify output filename"), 
               cl::value_desc("filename"), cl::init("-"));

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
  
  if(EnableAcqRelPass) PM.addPass(new tesla::AcquireReleasePass);
  if(EnableCallSeqPass) PM.addPass(new tesla::CallSequencePass);
  if(EnableModelChecker) PM.addPass(new tesla::ModelCheckerPass(32, 100));

  PM.runPasses();
  if(!PM.Manifest) {
    tesla::panic("Error applying manifest passes");
  }

  std::string ProtobufText;
  google::protobuf::TextFormat::PrintToString(PM.Manifest->getProtobuf(), &ProtobufText);

  std::unique_ptr<raw_fd_ostream> outfile;
  if(OutputFilename != "-") {
    string OutErrorInfo;
    outfile.reset(new raw_fd_ostream(OutputFilename.c_str(), OutErrorInfo));
  }
  raw_ostream& out = (OutputFilename == "-") ? llvm::outs() : *outfile;
  out << ProtobufText;

  google::protobuf::ShutdownProtobufLibrary();

  return 0;
}
