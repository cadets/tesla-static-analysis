#include "Analysis.h"

using std::string;

Analysis::Analysis(Module &M) : Mod(M) {
}

void Analysis::AddMessage(std::string e) {
  errs << "[" << AnalysisName() << "] " << e << '\n';
}

string Analysis::Message() {
  return errs.str();
}
