#include "AcquireReleaseCheck.h"
#include "AcquireReleasePass.h"
#include "Debug.h"

#include <llvm/PassManager.h>
#include <llvm/Support/raw_ostream.h>

#include <algorithm>
#include <vector>

using std::unique_ptr;
using std::set;

namespace tesla {

unique_ptr<Manifest> AcquireReleasePass::run(Manifest &Man, llvm::Module &Mod) {
  auto File = new ManifestFile();

  copyDefinitions(Man, File);

  // TODO: check that the arguments are equal
  auto acq = Man.FindAutomaton("acquire");
  auto rel = Man.FindAutomaton("release");
  std::vector<Argument> args;

  std::copy(acq->getAssertion().argument().begin(), 
            acq->getAssertion().argument().end(), 
            std::back_inserter(args));

  auto locs = ReferenceLocations(Man);
  for(auto root : Man.RootAutomata()) {
    auto automaton = Man.FindAutomaton(root->identifier());
    if(!automaton) {
      panic("Usage without associated automaton");
    }

    Usage *newRoot = new Usage;
    newRoot->CopyFrom(*root);

    if(UsesAcqRel(newRoot, locs)) {
      newRoot->set_deleted(ShouldDelete(automaton, args, Mod));
    }
    
    copyUsage(newRoot, File);
  }

  auto unique = unique_ptr<ManifestFile>(File);
  return unique_ptr<Manifest>(
      Manifest::construct(llvm::errs(), Automaton::Deterministic, std::move(unique)));
}

bool AcquireReleasePass::ShouldDelete(const Automaton *A, 
                                      std::vector<Argument> args, 
                                      llvm::Module &Mod) {
  /**
   * For now, we will only be working on usages that have their entry point as
   * the entry to a function, and their exit as an exit from that same function.
   * This simplifies the analysis to an intra-procedural one, as we aren't then
   * searching through arbitrary 'caller' points (we can just do so in the
   * function itself).
   */
  auto usage = A->Use();

  if(!HasSimpleBounds(usage)) {
    return false;
  }

  PassManager passes;
  auto check = new AcquireReleaseCheck(*A, args);
  passes.add(check);
  passes.run(Mod);

  return check->CorrectUsage();
}

/**
 * Return true if and only if the usage given has the simplest form of beginning
 * / end bounds - entry and exit for the same function.
 */
bool AcquireReleasePass::HasSimpleBounds(const Usage *usage) {
  if(usage->beginning().type() != Expression_Type_FUNCTION) {
    return false;
  }

  if(usage->end().type() != Expression_Type_FUNCTION) {
    return false;
  }

  if(usage->beginning().function().direction() != FunctionEvent_Direction_Entry) {
    return false;
  }

  if(usage->end().function().direction() != FunctionEvent_Direction_Exit) {
    return false;
  }

  return usage->beginning().function().function().name() ==
    usage->end().function().function().name();
}

/**
 * If we know that the usage has simple bounds (as described above), this
 * function can be used to get the name of that function.
 */
std::string AcquireReleasePass::SimpleBoundFunction(const Usage *usage) {
  return usage->beginning().function().function().name();
}

bool AcquireReleasePass::UsesAcqRel(const Usage *usage, set<const Location> &locs) {
  if(usage->identifier().has_location()) {
    if(locs.find(usage->identifier().location()) != locs.end()) {
      return true;
    }
  }

  return false;
}

bool AcquireReleasePass::ReferencesAcqRel(const AutomatonDescription *aut) {
  auto expr = aut->expression();

  if(expr.type() != Expression_Type_SEQUENCE) {
    return false;
  }

  if(!expr.has_sequence()) {
    tesla::panic("Expression has type SEQUENCE but no sequence data");
  }

  auto seq = expr.sequence().expression();
  for(auto it = seq.begin(); it != seq.end(); it++) {
    if(it->type() == Expression_Type_NULL_EXPR) {
      continue;
    }

    if(it->type() == Expression_Type_ASSERTION_SITE) {
      it++;
      if(it != seq.end() && it->type() == Expression_Type_SUB_AUTOMATON) {
        if(it->subautomaton().name() == AutomatonName()) {
          return true;
        }
      }
    }
  }

  return false;
}

set<const Location> AcquireReleasePass::ReferenceLocations(Manifest &Man) {
  auto ret = set<const Location>();

  for(auto entry : Man.AllAutomata()) {
    if(ReferencesAcqRel(entry.second)) {
      ret.insert(entry.first.location());
    }
  }

  return ret;
}

const std::string AcquireReleasePass::PassName() const {
  return "AcquireRelease";
}

const std::string AcquireReleasePass::AutomatonName() {
  return "acq_rel";
}

}
