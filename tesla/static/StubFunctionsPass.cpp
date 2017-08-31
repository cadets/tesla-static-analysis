#include <vector>

#include <llvm/Support/raw_ostream.h>

#include "StubFunctionsPass.h"

StubFunctionsPass::StubFunctionsPass() :
  ModulePass(ID)
{
}

void StubFunctionsPass::create_stubs(Module &M)
{
  auto stubs = std::vector<std::pair<std::string, FunctionType *>>{};

  for(auto& F : M) {
    if(F.isDeclaration()) {
      continue;
    }

    auto fn_type = F.getFunctionType();
    auto fn_name = F.getName().str();
    stubs.push_back(std::make_pair(entry_prefix + fn_name, fn_type));
    stubs.push_back(std::make_pair(return_prefix + fn_name, fn_type));
  }

  for(auto& p : stubs) {
    M.getOrInsertFunction(p.first, p.second);
  }
}

void StubFunctionsPass::call_stubs(Module &M)
{
  auto visitor = CallStubsVisitor{M};
  visitor.visit(M);
}

bool StubFunctionsPass::runOnModule(Module &M)
{
  create_stubs(M);
  call_stubs(M);
  return true;
}

CallStubsVisitor::CallStubsVisitor(Module &M) :
  module_(M)
{
}

void CallStubsVisitor::visitCallInst(CallInst &CI)
{
  if(auto fn = dyn_cast<Function>(CI.getCalledValue()->stripPointerCasts())) {
    if(fn->isDeclaration()) {
      return;
    }

    auto args = std::vector<Value *>{};
    for(auto i = 0; i < CI.getNumArgOperands(); i++) {
      args.push_back(CI.getArgOperand(i));
    }

    auto entry_stub = module_.getFunction(StubFunctionsPass::entry_prefix + fn->getName().str());
    auto return_stub = module_.getFunction(StubFunctionsPass::return_prefix + fn->getName().str());

    auto entry_call = CallInst::Create(entry_stub, args);
    auto return_call = CallInst::Create(return_stub, args);
    entry_call->insertBefore(&CI);
    return_call->insertAfter(&CI);
    CI.replaceAllUsesWith(return_call);
  }
}

char StubFunctionsPass::ID = 0;
const std::string StubFunctionsPass::entry_prefix = "__entry_stub_";
const std::string StubFunctionsPass::return_prefix = "__return_stub_";
