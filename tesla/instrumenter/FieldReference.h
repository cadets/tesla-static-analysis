/*
 * Copyright (c) 2013 Jonathan Anderson
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

#include <llvm/ADT/StringMap.h>
#include <llvm/Pass.h>
#include <map>

#include "Instrumenter.h"
#include "Transition.h"

namespace llvm {
  class Function;
  class LoadInst;
  class StoreInst;
  class Value;
}

namespace tesla {

class Automaton;
class FieldInstrumentation;
class Manifest;

/// Converts calls to TESLA pseudo-assertions into instrumentation sites.
class FieldReferenceInstrumenter
  : public Instrumenter, public llvm::ModulePass {
public:
  static char ID;
  FieldReferenceInstrumenter(const Manifest& M, bool SuppressDI)
    : Instrumenter(M, SuppressDI), ModulePass(ID) {}
  llvm::StringRef getPassName() const { return "field reference instrumenter"; }

  ~FieldReferenceInstrumenter();

  virtual bool runOnModule(llvm::Module &M);

private:
  void BuildInstrumentation(const Automaton&);
  FieldInstrumentation *GetInstr(const Automaton&, const TEquivalenceClass&);

  void AppendInstrumentation(llvm::Function*, const Automaton&,
                             const FieldAssignment&, TEquivalenceClass&);

  bool InstrumentLoad(llvm::LoadInst*, FieldInstrumentation*);
  bool InstrumentStore(llvm::StoreInst*, FieldInstrumentation*);

  llvm::Module *Mod;
  llvm::StringMap<FieldInstrumentation*> Instrumentation;
};

}
