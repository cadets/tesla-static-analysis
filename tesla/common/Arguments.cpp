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

void tesla::ParseAssertionLocation(
  Location *Loc, CallInst *Call) {

  assert(Call->getCalledFunction()->getName() == INLINE_ASSERTION);

  if (Call->getNumArgOperands() < 4)
    panic("TESLA assertion must have at least 4 arguments");

  // The filename (argument 1) should be a global variable.
  GlobalVariable *NameVar =
    dyn_cast<GlobalVariable>(Call->getOperand(1)->stripPointerCasts());


  if(!NameVar) {
    panic("No named constant for filename - unable to parse");
  }

  string fn;

  if(auto sty = dyn_cast<ConstantStruct>(NameVar->getInitializer())) {
    fn = "";
    for(auto i = 0; i < sty->getNumOperands(); i++) {
      if(auto cda = dyn_cast<ConstantDataArray>(sty->getOperand(i))) {
        fn += cda->getAsString();
      }
    }
  } else if (auto A = dyn_cast_or_null<ConstantDataArray>(NameVar->getInitializer())) {
    fn = A->getAsString();
  } else {
    Call->dump();
    panic("unable to parse filename from TESLA assertion");
  }

  // This is a hack - getAsString gives us a string with a null terminator
  // attached, but this gets implicitly removed when serialising. Therefore when
  // comparing an in-memory location with one loaded from disk, the comparison
  // will fail due to the extra character. Here we check for it and remove it
  // before doing anything else.
  if(fn[fn.size()- 1] == '\0') {
    fn = fn.substr(0, fn.size() - 1);
  }

  *Loc->mutable_filename() = fn;


  // The line and counter values should be constant integers.
  ConstantInt *Line = dyn_cast<ConstantInt>(Call->getOperand(2));
  if (!Line) {
    Call->getOperand(2)->dump();
    panic("assertion line must be a constant int");
  }

  Loc->set_line(Line->getLimitedValue(INT_MAX));

  ConstantInt *Count = dyn_cast<ConstantInt>(Call->getOperand(3));
  if (!Count) {
    Call->getOperand(3)->dump();
    panic("assertion count must be a constant int");
  }

  Loc->set_counter(Count->getLimitedValue(INT_MAX));
}

llvm::Function* calledOrCastFunction(llvm::CallInst *ci)
{
  auto num = ci->getNumOperands() - 1;
  if(auto cst = llvm::dyn_cast<llvm::ConstantExpr>(ci->getOperand(num))) {
    if(cst->isCast()) {
      if(auto fn = llvm::dyn_cast<llvm::Function>(cst->getOperand(0))) {
        return fn;
      }
    }
  }

  return ci->getCalledFunction();
}
