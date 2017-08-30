/*! @file Assertion.cpp  Code for instrumenting TESLA assertion sites. */
/*
 * Copyright (c) 2012-2013 Jonathan Anderson
 * All rights reserved.
 *
 * This software was developed by SRI International and the University of
 * Cambridge Computer Laboratory under DARPA/AFRL contract (FA8750-10-C-0237)
 * ("CTSRD"), as part of the DARPA CRASH research programme.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#include "Arguments.h"
#include "Assertion.h"
#include "Automaton.h"
#include "Debug.h"
#include "EventTranslator.h"
#include "InstrContext.h"
#include "Instrumentation.h"
#include "Manifest.h"
#include "Names.h"
#include "State.h"
#include "Transition.h"
#include "TranslationFn.h"

#include "tesla.pb.h"

#include <libtesla.h>

#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/raw_ostream.h>

#include <iostream>
#include <set>

using namespace llvm;

using std::set;
using std::string;
using std::vector;


namespace tesla {

char AssertionSiteInstrumenter::ID = 0;

AssertionSiteInstrumenter::~AssertionSiteInstrumenter() {
  ::google::protobuf::ShutdownProtobufLibrary();
}

bool AssertionSiteInstrumenter::runOnModule(Module &M) {
  InstrCtx.reset(InstrContext::Create(M, SuppressDebugInstr));

  // Replace all structure automaton "anchors" with automata definitions.
  for (auto &Fn : M) {
    StringRef Name = Fn.getName();
    if (not Name.startswith(STRUCT_AUTOMATON))
      continue;

    Name = Name.substr(STRUCT_AUTOMATON.length());
    Identifier ID;
    ID.set_name(Name.str());

    const Automaton *A = this->M.FindAutomaton(ID);
    if (not A) {
      llvm::errs() << "TESLA manifest does not contain " << Name << "\n";
      panic("missing automaton definition", false);
    }

    assert(A->Name() == Name);

    if (Function *AutomatonDefinition = M.getFunction(Name))
      AutomatonDefinition->eraseFromParent();

    InstrCtx->BuildAutomatonDescription(A);
  }

  // If this module doesn't declare any assertions, just carry on.
  AssertFn = M.getFunction(INLINE_ASSERTION);
  if (!AssertFn)
    return false;

  // Find all calls to TESLA assertion pseudo-function (before we modify IR).
  set<CallInst*> AssertCalls;
  for (auto I = AssertFn->use_begin(); I != AssertFn->use_end(); ++I)
    AssertCalls.insert(cast<CallInst>(I->getUser()));

  return ConvertAssertions(AssertCalls, M);
}


bool AssertionSiteInstrumenter::ConvertAssertions(
    set<CallInst*>& AssertCalls, Module& Mod) {

  for (auto *AssertCall : AssertCalls) {
    auto *Automaton(FindAutomaton(AssertCall));
    if(!Automaton->Use()->deleted()) {
      auto AssertTransitions(this->AssertTrans(Automaton));

      // Generate the static automaton description.
      InstrCtx->BuildAutomatonDescription(Automaton);

      // Convert the assertion into appropriate instrumentation.
      IRBuilder<> Builder(AssertCall);
      vector<Value*> Args(CollectArgs(AssertCall, *Automaton, Mod, Builder));

      TranslationFn *TransFn = InstrCtx->CreateInstrFn(*Automaton, Args);
      TransFn->InsertCallBefore(AssertCall, Args);

      EventTranslator E = TransFn->AddInstrumentation(*Automaton);
      E.CallUpdateState(*Automaton, AssertTransitions.Symbol);
    }

    // Delete the call to the assertion pseudo-function.
    AssertCall->removeFromParent();
    delete AssertCall;
  }

  AssertFn->removeFromParent();
  delete AssertFn;

  return true;
}

const Automaton* AssertionSiteInstrumenter::FindAutomaton(CallInst *Call) {
  Location Loc;
  ParseAssertionLocation(&Loc, Call);

  return M.FindAutomaton(Loc);
}


TEquivalenceClass AssertionSiteInstrumenter::AssertTrans(const Automaton *A) {
  for (auto EquivClass : *A)
    if (isa<AssertTransition>(*EquivClass.begin()))
      return EquivClass;

  panic("automaton '" + A->Name() + "' has no assertion site event");
}


vector<Value*> AssertionSiteInstrumenter::CollectArgs(
    Instruction *Before, const Automaton& A,
    Module& Mod, IRBuilder<>& Builder) {
  return tesla::CollectArgs(Before, A, Mod, Builder);
}

}
