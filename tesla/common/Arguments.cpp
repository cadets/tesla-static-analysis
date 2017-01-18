#include <algorithm>

#include "Arguments.h"

#include "Automaton.h"
#include "Debug.h"

using namespace llvm;

using std::string;
using std::vector;

vector<Value*> tesla::CollectArgs(
    Instruction *Before, vector<tesla::Argument> args,
    Module& Mod, IRBuilder<>& Builder) {
  // Find named values to be passed to instrumentation.
  std::map<string,Value*> ValuesInScope;
  for (auto G = Mod.global_begin(); G != Mod.global_end(); G++)
    ValuesInScope[G->getName()] = G;

  auto *Fn = Before->getParent()->getParent();
  for (auto& Arg : Fn->getArgumentList())
    ValuesInScope[Arg.getName()] = &Arg;

  auto& EntryBlock(*Fn->begin());
  for (auto& I : EntryBlock) {
    auto *Inst = dyn_cast<AllocaInst>(&I);
    if (!Inst)
      break;

    ValuesInScope[Inst->getName()] = Builder.CreateLoad(Inst);
  }

  int ArgSize = 0;
  for (auto& Arg : args)
    if (!Arg.free())
      ArgSize = std::max(ArgSize + 1, Arg.index());

  vector<Value*> Args(ArgSize, NULL);

  for (auto& Arg : args) {
    if (Arg.free())
      continue;

    string Name(BaseName(Arg));

    if (ValuesInScope.find(Name) == ValuesInScope.end()) {
      string s;
      raw_string_ostream Out(s);

      for (auto v : ValuesInScope) {
        Out << "  \"" << v.first << "\": ";
        v.second->getType()->print(Out);
        Out << "\n";
      }

      panic("assertion references non-existent variable '" + BaseName(Arg)
         + "'; was it defined under '#ifdef TESLA'?\n\n"
           "Variables in scope are:\n" + Out.str());
    }

    Args[Arg.index()] =
      GetArgumentValue(ValuesInScope[Name], Arg, Builder, true);
  }

  return Args;
}

vector<Value*> tesla::CollectArgs(
    Instruction *Before, const Automaton& A,
    Module& Mod, IRBuilder<>& Builder) {

  vector<Argument> newArgs;
  auto args = A.getAssertion().argument();

  std::copy(args.begin(), args.end(), std::back_inserter(newArgs));
  return tesla::CollectArgs(Before, newArgs, Mod, Builder);
}

Value* tesla::GetArgumentValue(Value* Param, const Argument& ArgDescrip,
                               IRBuilder<>& Builder, bool AtAssertionSite) {

  switch (ArgDescrip.type()) {
  case Argument::Constant:
  case Argument::Any:
  case Argument::Variable:
    return Param;

  case Argument::Indirect:
    // At the assertion site, we don't do the indirection thing: we are
    // referring to local values.
    if (AtAssertionSite)
      return Param;

    Param = Builder.CreateLoad(Param);
    return GetArgumentValue(Param, ArgDescrip.indirection(), Builder);

  case Argument::Field: {
    // We only need to do the indirect lookup via struct fields at the
    // assertion site; otherwise, we just care about local values.
    if (!AtAssertionSite)
      return Param;

    const StructField& Field = ArgDescrip.field();
    const Argument& BaseArg = Field.base();
    auto *Base = GetArgumentValue(Param, BaseArg, Builder, AtAssertionSite);

    string Name = (
      (Base->hasName()
        ? Base->getName()
        : StringRef(BaseName(BaseArg))
      )
      + "." + Field.name()
    ).str();

    Param = Builder.CreateConstInBoundsGEP2_32(Base, 0, Field.index());
    Param = Builder.CreateLoad(Param, Name);

    return Param;
  }
  }
}
