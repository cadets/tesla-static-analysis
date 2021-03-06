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

#ifndef	TESLA_CALLEE_INSTRUMENTATION_H
#define	TESLA_CALLEE_INSTRUMENTATION_H

#include "InstrContext.h"
#include "Instrumenter.h"
#include "Instrumentation.h"

#include "tesla.pb.h"

#include <llvm/ADT/StringMap.h>
#include <llvm/ADT/StringRef.h>
#include <llvm/Pass.h>

namespace llvm {
  class Function;
  class Instruction;
  class LLVMContext;
  class Module;
  class Value;
}

namespace tesla {

class Manifest;
class ObjCInstrumentation;

/// Instruments function calls in the callee context.
class FnCalleeInstrumenter : public Instrumenter, public llvm::ModulePass {
public:
  static char ID;
  FnCalleeInstrumenter(const Manifest& M, bool SuppressDI)
    : Instrumenter(M, SuppressDI), ModulePass(ID), ObjC(0) {}
  ~FnCalleeInstrumenter();

  llvm::StringRef getPassName() const {
    return "TESLA function instrumenter (callee-side)";
  }

  virtual bool runOnModule(llvm::Module &M);

private:
  ObjCInstrumentation* ObjC;
  TranslationFn* GetOrCreateInstr(llvm::Function*, const FunctionEvent&);

  std::unique_ptr<InstrContext> InstrCtx;

  llvm::StringMap<TranslationFn*> Entry;
  llvm::StringMap<TranslationFn*> Exit;
};

}

#endif	/* !TESLA_CALLEE_INSTRUMENTATION_H */
