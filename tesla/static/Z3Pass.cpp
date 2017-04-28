#include <llvm/PassManager.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Scalar.h>

#include "inline_all_pass.h"
#include "stub_functions_pass.h"
#include "z3_checker.h"
#include "Z3Pass.h"

static cl::opt<bool>
PrintCounterexamples("print-counter", cl::desc("Print counterexample info to stderr"),
                     cl::init(false));                     

namespace tesla {

unique_ptr<Manifest> Z3Pass::run(Manifest& man, Module& mod)
{
  PassManager Passes;
  Passes.add(createPromoteMemoryToRegisterPass());
  Passes.add(new StubFunctionsPass);
  Passes.run(mod);

  auto File = new ManifestFile();

  copyDefinitions(man, File);
  for (auto root : man.RootAutomata()) {
    auto automaton = man.FindAutomatonSafe(root->identifier());
    if (!automaton) {
      panic("Usage without associated automaton");
    }

    Usage *newRoot = new Usage;
    newRoot->CopyFrom(*root);

    newRoot->set_deleted(CheckUsage(man, mod, newRoot));

    copyUsage(newRoot, File);
  }

  auto unique = unique_ptr<ManifestFile>(File);
  return unique_ptr<Manifest>(Manifest::construct(
      errs(), Automaton::Deterministic, std::move(unique)));
}
  
bool Z3Pass::CheckUsage(Manifest &man, Module &mod, const Usage *use)
{
  auto bound = bound_function(mod, use);
  if(!bound) {
    return false;
  }

  if(inlined_functions_.find(bound) == inlined_functions_.end()) {
    FunctionPassManager Passes(&mod);
    Passes.add(new InlineAllPass(inline_depth_));
    Passes.add(createCFGSimplificationPass());
    Passes.run(*bound);

    inlined_functions_.insert(bound);
  }

  auto automaton = man.FindAutomaton(use->identifier());
  auto expr = automaton->getAssertion().expression();

  auto&& safe = Z3Checker{*bound, man, expr, bmc_bound_}.is_safe();
  if(!safe && PrintCounterexamples) {
    safe.dump();
  }
  return safe;
}

bool Z3Pass::has_checkable_bounds(const tesla::Usage *use) const
{
  const auto& begin = use->beginning();
  const auto& end = use->end();

  if(begin.type() != Expression_Type_FUNCTION ||
     end.type() != Expression_Type_FUNCTION) {
    return false;
  }

  const auto& begin_event = begin.function();
  const auto& end_event = end.function();
  
  if(begin_event.direction() != FunctionEvent_Direction_Entry ||
     end_event.direction() != FunctionEvent_Direction_Exit) {
    return false;
  }

  return begin_event.function().name() == end_event.function().name();
}

Function *Z3Pass::bound_function(Module& mod, const tesla::Usage *use) const
{
  if(!has_checkable_bounds(use)) {
    return nullptr;
  }

  return mod.getFunction(use->end().function().function().name());
}

const std::string Z3Pass::PassName() const 
{
  return "Z3Pass";
}

}
