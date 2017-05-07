//===- instrument.cpp - Driver for TESLA instrumentation passes -----------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file is derived from LLVM's 'tools/opt/opt.cpp'. It has been cut down
// to only invokes TESLA instrumentation passes, but many useful arguments to
// 'opt' still work, e.g. -p, -S and -verify-each.
//
//===----------------------------------------------------------------------===//

#include "Assertion.h"
#include "Callee.h"
#include "Caller.h"
#include "Debug.h"
#include "FieldReference.h"
#include "Manifest.h"
#include "Remove.h"

#include <llvm/ADT/Triple.h>
#include <llvm/Analysis/CallGraph.h>
#include <llvm/Analysis/TargetLibraryInfo.h>
#include <llvm/Bitcode/BitcodeWriterPass.h>
#include <llvm/Bitcode/ReaderWriter.h>
#include <llvm/CodeGen/CommandFlags.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/IRPrintingPasses.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Verifier.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Target/TargetMachine.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/ManagedStatic.h>
#include <llvm/Support/PrettyStackTrace.h>
#include <llvm/Support/SystemUtils.h>
#include <llvm/Support/TargetRegistry.h>
#include <llvm/Support/ToolOutputFile.h>

using namespace llvm;
using llvm::legacy::PassManager;

// Command line options.
//
static cl::opt<std::string>
InputFilename(cl::Positional, cl::desc("<input bitcode file>"),
    cl::init("-"), cl::value_desc("filename"));

static cl::opt<std::string>
OutputFilename("o", cl::desc("Override output filename"),
               cl::value_desc("filename"));

static cl::opt<bool>
Force("f", cl::desc("Enable binary output on terminals"));

static cl::opt<bool>
PrintEachXForm("p", cl::desc("Print module after each transformation"));

static cl::opt<bool>
OutputAssembly("S", cl::desc("Write output as LLVM assembly"));

static cl::opt<bool>
SuppressDI("suppress-debug-instrumentation",
    cl::desc("Suppress the generation of debug output in instrumentation"));

static cl::opt<bool>
VerifyEach("verify-each", cl::desc("Verify after each transform"));


static inline void addPass(PassManagerBase &PM, Pass *P) {
  // Add the pass to the pass manager...
  PM.add(P);

  // If we are verifying all of the intermediate steps, add the verifier...
  if (VerifyEach) PM.add(createVerifierPass());

  // Optionally print the result of each pass...
  if (PrintEachXForm) PM.add(createPrintModulePass(errs()));
}

//===----------------------------------------------------------------------===//
//
int main(int argc, char **argv) {
  llvm::PrettyStackTraceProgram X(argc, argv);

  llvm_shutdown_obj Y;  // Call llvm_shutdown() on exit.
  LLVMContext &Context = getGlobalContext();

  cl::ParseCommandLineOptions(argc, argv, "TESLA bitcode instrumenter\n");

  SMDiagnostic Err;

  // Load TESLA manifest file.
  std::unique_ptr<tesla::Manifest> Manifest(tesla::Manifest::load(llvm::errs()));
  if (!Manifest)
    tesla::panic("unable to load TESLA manifest");

  // Load the input module...
  std::unique_ptr<Module> M(parseIRFile(InputFilename, Err, Context));

  if (M.get() == 0) {
    Err.print(argv[0], errs());
    return 1;
  }

  // Output stream...
  std::unique_ptr<tool_output_file> Out;
  if (OutputFilename.empty())
    OutputFilename = "-";

  std::error_code ErrorInfo;
  Out.reset(new tool_output_file(OutputFilename.c_str(), ErrorInfo,
                                   sys::fs::F_RW));
  if (ErrorInfo) {
    errs() << ErrorInfo.message() << '\n';
    return 1;
  }

  // If the output is set to be emitted to standard out, and standard out is a
  // console, print out a warning message and refuse to do it.  We don't
  // impress anyone by spewing tons of binary goo to a terminal.
  bool NoOutput = false;
  if (!Force && !OutputAssembly)
    if (CheckBitcodeOutputToConsole(Out->os(), true))
      NoOutput = true;

  // Create a PassManager to hold and optimize the collection of passes we are
  // about to build.
  //
  PassManager Passes;

  // Add an appropriate TargetLibraryInfo pass for the module's triple.
  auto TLI = new TargetLibraryInfoWrapperPass(Triple(M->getTargetTriple()));
  Passes.add(TLI);

  // Add an appropriate DataLayout instance for this module.
  // ???: const auto ModuleDataLayout = M.get()->getDataLayout();

  // Just add TESLA instrumentation passes.
  if(Manifest->HasInstrumentation()) {
    addPass(Passes, new tesla::AssertionSiteInstrumenter(*Manifest, SuppressDI));
    addPass(Passes, new tesla::FnCalleeInstrumenter(*Manifest, SuppressDI));
    addPass(Passes, new tesla::FnCallerInstrumenter(*Manifest, SuppressDI));
    addPass(Passes, new tesla::FieldReferenceInstrumenter(*Manifest, SuppressDI));
  } else {
    addPass(Passes, new tesla::RemoveInstrumenter(*Manifest, SuppressDI));
  }

  // Write bitcode or assembly to the output as the last step...
  if (!NoOutput) {
    if (OutputAssembly)
      Passes.add(createPrintModulePass(Out->os()));
    else
      Passes.add(createBitcodeWriterPass(Out->os()));
  }

  // Before executing passes, print the final values of the LLVM options.
  cl::PrintOptionValues();

  // Now that we have all of the passes ready, run them.
  Passes.run(*M.get());

  // Declare success.
  if (!NoOutput)
    Out->keep();

  return 0;
}

