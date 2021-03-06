/*! @file Manifest.h  Declaration of @ref tesla::Manifest. */
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

#ifndef TESLA_MANIFEST_H
#define TESLA_MANIFEST_H

#include "Automaton.h"
#include "Names.h"

#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/StringRef.h>
#include <llvm/Support/CommandLine.h>

#include <map>
#include <vector>

namespace llvm {
  class raw_ostream;
}

namespace tesla {

extern llvm::cl::opt<std::string> ManifestName;

class AutomatonDescription;
class FunctionEvent;
class Identifier;
class Location;
class Usage;

/// A description of TESLA instrumentation to perform.
class Manifest {
public:
  Manifest(const Manifest&) = delete;
  ~Manifest();

  //! Top-level automata (named explicitly in code).
  llvm::ArrayRef<const Usage*> RootAutomata() const { return Roots; }

  //! Have all the usages in this manifest been deleted by static analysis? 
  bool HasInstrumentation() const;

  //! All automata in the manifest file.
  const AutomataMap& AllAutomata() const { return Descriptions; }

  //! Find the @ref tesla::Automaton named by an @ref tesla::Identifier.
  const Automaton* FindAutomaton(const Identifier&) const;

  //! Find the @ref tesla::Automaton defined at a @ref tesla::Location.
  const Automaton* FindAutomaton(const Location&) const;

  //! Find the @red tesla::Automaton with this name
  const Automaton* FindAutomaton(std::string name) const;

  //! Find the @ref tesla::Automaton named by an @ref tesla::Identifier.
  //  Will return `nullptr` instead of panicking if the automaton is not found.
  const Automaton* FindAutomatonSafe(const Identifier&) const;

  //! Find the @ref tesla::Automaton defined at a @ref tesla::Location.
  //  Will return `nullptr` instead of panicking if the automaton is not found.
  const Automaton* FindAutomatonSafe(const Location&) const;
  
  //! Find the @red tesla::Automaton with this name
  //  Will return `nullptr` instead of panicking if the automaton is not found.
  const Automaton* FindAutomatonSafe(std::string name) const;

  const llvm::ArrayRef<Automaton::Lifetime> getLifetimes() const {
    return Lifetimes;
  }

  const ManifestFile &getProtobuf() const { 
    return *Protobuf;
  }

  //! Load a @ref tesla::Manifest from a named file.
  static Manifest* load(llvm::raw_ostream& Err,
                        Automaton::Type = Automaton::Deterministic,
                        llvm::StringRef Path = defaultLocation());

  //! Construct a @ref tesla::Manifest from an in-memory protobuf representation.
  static Manifest* construct(llvm::raw_ostream& err,
                             Automaton::Type type,
                             std::unique_ptr<ManifestFile> manifest);

  /*!
   * The default location to look for a TESLA manifest.
   *
   * This could be specified by a command-line option.
   */
  static llvm::StringRef defaultLocation();

private:
  Manifest(std::unique_ptr<ManifestFile>& Protobuf,
           const AutomataMap& Descriptions,
           const std::map<Identifier,const Automaton*>& Automata,
           llvm::ArrayRef<const Usage*> Roots,
           llvm::ArrayRef<Automaton::Lifetime> Lifetimes)
    : Protobuf(std::move(Protobuf)), Descriptions(Descriptions), Automata(Automata),
      Roots(Roots), Lifetimes(Lifetimes)
  {
  }

  const Automaton* FindAutomaton(llvm::StringRef Name, Automaton::Type) const;

  static const std::string SEP;   //!< Delineates automata in a TESLA file.

  //! Storage of the protocol buffer.
  std::unique_ptr<ManifestFile> Protobuf;

  //! The abstract descriptions.
  AutomataMap Descriptions;

  //! The automata.
  std::map<Identifier,const Automaton*> Automata;

  //! Root automata (those named explicitly by the programmer).
  llvm::ArrayRef<const Usage*> Roots;

  std::vector<Automaton::Lifetime> Lifetimes;
};

}

#endif  /* !TESLA_MANIFEST_H */
