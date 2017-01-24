#include "Analysis.h"

using std::string;

Analysis::Analysis(Module &M) : Mod(M) {
}

void Analysis::AddMessage(std::string e) {
  errs << "[" << AnalysisName() << "] " << e;
}

string Analysis::Message() {
  return errs.str();
}
