/*! @file Arguments.h Helpers for collecting assertion arguments */

#ifndef TESLA_ARGUMENTS_H
#define TESLA_ARGUMENTS_H

#include "tesla.pb.h"

#include <libtesla.h>

#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/raw_ostream.h>

#include <vector>

namespace llvm {
  class Instruction;
  class Module;
  class Value;
}

namespace tesla {

class Automaton;

//!
std::vector<llvm::Value*> CollectArgs(llvm::Instruction *, const Automaton&,
                                      llvm::Module&, llvm::IRBuilder<>&);

//!
std::vector<llvm::Value*> CollectArgs(llvm::Instruction *, std::vector<tesla::Argument>,
                                      llvm::Module&, llvm::IRBuilder<>&);

//! Poke through indirection, struct fields, etc.
llvm::Value* GetArgumentValue(llvm::Value* Param, const Argument& ArgDescrip,
                              llvm::IRBuilder<>& Builder,
                              bool AtAssertionSite = false);

/**
 * Parse a @ref Location out of a @ref CallInst to the TESLA assertion
 * pseudo-call.
 */
void ParseAssertionLocation(Location *Loc, llvm::CallInst*);
}

#endif
