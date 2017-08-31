#ifndef MANIFEST_PASS_H
#define MANIFEST_PASS_H

#include "Manifest.h"

#include <llvm/IR/Module.h>

namespace tesla {

/*!
 * Static analysis pass to be run on a TESLA manifest.
 *
 * This class is designed to be subclassed by implementors of a particular
 * static analysis for TESLA. The interface defined allows passes to copy across
 * definitions, possibly modifying fields in the protobuf structure to affect
 * the instrumentation process.
 *
 * Currently, the only meaningful change that a pass can make is to mark a usage
 * as deleted. Doing this causes the instrumenter to omit instrumentation code.
 * See \ref Z3Pass.cpp and \ref AcquireReleasePass.cpp for example
 * implementations.
 */
class ManifestPass {
public:
  /// Run the pass on a manifest and associated module
  virtual std::unique_ptr<Manifest> run(Manifest &Ma, llvm::Module &Mo) = 0;
  
  /// Pass name for debugging
  virtual const std::string PassName() const = 0;
  
  /// Log an error message
  const std::string Error(std::string message) const;

  /// Log a debug message
  const std::string Debug(std::string message) const;

protected:
  /*!
   * Copy existing automata definitions into a new file.
   *
   * Most subclasses will want to do this, as removing definitions is likely to
   * break instrumentation quite badly.
   */
  void copyDefinitions(Manifest &Ma, ManifestFile *file) const;

  /// Copy a single root usage to a new file
  void copyUsage(const Usage *usage, ManifestFile *file) const;

private:
  const std::string PrefixMessage(std::string prefix, std::string message) const;
};

}

#endif
