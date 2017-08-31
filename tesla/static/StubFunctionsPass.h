#ifndef STUB_FUNCTIONS_PASS_H
#define STUB_FUNCTIONS_PASS_H

#include <llvm/Pass.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/InstVisitor.h>
#include <llvm/IR/Module.h>

using namespace llvm;

class StubFunctionsPass : public ModulePass {
public:
  StubFunctionsPass();

  bool runOnModule(Module &M);

  static char ID;

  static const std::string entry_prefix;
  static const std::string return_prefix;
private:
  void create_stubs(Module &M);
  void call_stubs(Module &M);
};

class CallStubsVisitor : public InstVisitor<CallStubsVisitor> {
public:
  CallStubsVisitor(Module &M);
  void visitCallInst(CallInst &CI);

private:
  Module& module_;
};

#endif
