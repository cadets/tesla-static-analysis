/*! @file Parser.h  Declaration of @ref Parser. */
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

#ifndef PARSER_H
#define PARSER_H

#include <tesla.pb.h>

#include <llvm/ADT/APInt.h>

#include <string>
#include <vector>

namespace clang {
  class ASTContext;
  class BinaryOperator;
  class CallExpr;
  class CompoundStmt;
  class Decl;
  class DeclRefExpr;
  class Expr;
  class FunctionDecl;
  class SourceLocation;
  class SourceRange;
  class Stmt;
  class ValueDecl;
}

namespace llvm {
  class APSInt;
}


namespace tesla {

//! A parser for TESLA automata descriptions.
class Parser {
public:
  //! Variables referenced by an automaton.
  typedef std::vector<const clang::ValueDecl*> RefVector;

  //! A method that parses @ref clang::CallExpr (predicate, sub-automaton...).
  typedef bool (Parser::*CallParser)(Expression*, const clang::CallExpr*);


  //! Create a Parser for an inline assertion.
  static Parser* AssertionParser(clang::CallExpr*, clang::ASTContext&);

  //! Create a Parser for an automaton description.
  static Parser* AutomatonParser(clang::FunctionDecl*, clang::ASTContext&);

  AutomatonDescription* Parse();


private:
  Parser(clang::ASTContext& Ctx, Identifier ID = Identifier(),
         AutomatonDescription::Context C = AutomatonDescription::Global,
         clang::Stmt *Root = NULL)
    : Ctx(Ctx), ID(ID), TeslaContext(C), Root(Root)
  {
  }

  bool Parse(Location*, clang::Expr*, clang::Expr*, clang::Expr*);
  bool Parse(AutomatonDescription::Context*, clang::Expr*);

  bool Parse(Expression*, const clang::CompoundStmt*);
  bool Parse(Expression*, const clang::Expr*);
  bool Parse(Expression*, const clang::BinaryOperator*);
  bool Parse(Expression*, const clang::CallExpr*);
  bool Parse(Expression*, const clang::DeclRefExpr*);

  bool Parse(FunctionRef*, const clang::FunctionDecl*);
  bool Parse(Argument*, const clang::Expr*);
  bool Parse(Argument*, const clang::ValueDecl*, bool AllowAny);

  bool ParseSubAutomaton(Expression*, const clang::CallExpr*);
  bool ParsePredicate(Expression*, const clang::CallExpr*);

  // TESLA predicates:
  bool ParseFunctionCall(Expression*, const clang::CallExpr*);
  bool ParseFunctionReturn(Expression*, const clang::CallExpr*);
  bool ParseOptional(Expression*, const clang::CallExpr*);
  bool ParseSequence(Expression*, const clang::CallExpr*);

  //! Helper for @ref ParseFunctionCall and @ref ParseFunctionReturn.
  bool ParseFunctionPredicate(FunctionEvent*, const clang::CallExpr*,
                              bool ParseRetVal);

  //! Parse 'foo(x) == y'.
  bool ParseFunctionCall(Expression*, const clang::BinaryOperator*);

  //! Parse 'x->foo = bar'.
  bool ParseFieldAssign(Expression*, const clang::BinaryOperator*);


  //! Parse a literal C string embedded in code.
  std::string ParseStringLiteral(const clang::Expr*);

  //! Parse an Integer Constant Expression (ICE).
  llvm::APInt ParseIntegerLiteral(const clang::Expr*);


  //! The index of a variable in our set of unique variable references.
  size_t ReferenceIndex(const clang::ValueDecl*);


  //! Report a TESLA error.
  void ReportError(llvm::StringRef Message, const clang::Decl*);
  void ReportError(llvm::StringRef Message, const clang::Stmt*);
  void ReportError(llvm::StringRef Message, const clang::SourceLocation&,
                   const clang::SourceRange&);



  clang::ASTContext& Ctx;

  const Identifier ID;
  const AutomatonDescription::Context TeslaContext;
  const clang::Stmt *Root;

  RefVector References;
};

}

#endif  // PARSERS_H
