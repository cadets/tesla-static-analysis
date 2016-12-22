#include "ManifestPass.h"

#include <llvm/Support/raw_ostream.h>
#include <sstream>

using std::string;
using std::stringstream;

namespace tesla {

const string ManifestPass::Error(string message) const {
  return PrefixMessage("Error", message);
}

const string ManifestPass::Debug(string message) const {
  return PrefixMessage("Debug", message);
}

const string ManifestPass::PrefixMessage(string pre, string message) const {
  stringstream ss;
  ss << pre << " (" << PassName() << "): " << message;
  return ss.str();
}

void ManifestPass::copyDefinitions(Manifest &Ma, ManifestFile *file) const {
  for(auto entry : Ma.AllAutomata()) {
    *file->add_automaton() = *entry.second;
  }
}

}
