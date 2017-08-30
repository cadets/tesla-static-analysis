#include "Debug.h"
#include "Manifest.h"
#include "tesla.pb.h"

#include "model-checker/Z3Pass.h"
#include "mutex/AcquireReleasePass.h"

#include <google/protobuf/text_format.h>
#include <llvm/Pass.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Transforms/Utils/Cloning.h>

using namespace llvm;

namespace {

static cl::opt<int>
UnrollDepth("tmc-unroll", cl::desc("Event graph recursion depth (default=32)"),
            cl::init(32));

static cl::opt<int>
TraceBound("tmc-bound", cl::desc("Finite model checking bound (default=50)"),
            cl::init(50));

struct StaticPass : public ModulePass {
  static char ID;
  StaticPass() : ModulePass(ID) {}

  virtual bool runOnModule(Module& M) override;
};

bool StaticPass::runOnModule(Module& M)
{
  std::unique_ptr<tesla::Manifest> manifest(tesla::Manifest::load(errs(), tesla::Automaton::Deterministic));
  if(!manifest) {
    tesla::panic("unable to load TESLA manifest");
  }

  tesla::Z3Pass tmc(UnrollDepth, TraceBound);
  auto&& new_man = tmc.run(*manifest, *CloneModule(&M));

  std::string proto_text;
  google::protobuf::TextFormat::PrintToString(new_man->getProtobuf(), &proto_text);

  std::error_code OutErrorInfo;
  raw_fd_ostream outfile(tesla::ManifestName, OutErrorInfo, llvm::sys::fs::F_RW);
  outfile << proto_text;

  google::protobuf::ShutdownProtobufLibrary();

  return false;
}

char StaticPass::ID = 0;
static RegisterPass<StaticPass> X("tesla-static", "Optimise TESLA instrumentation statically");

}
