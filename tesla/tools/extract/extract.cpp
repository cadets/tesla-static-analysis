#include <array>
#include <fstream>

#include <sys/stat.h>

#include <llvm/Support/CommandLine.h>
#include <llvm/Support/raw_ostream.h>

#include "Debug.h"

using namespace llvm;

static cl::opt<std::string>
InputFilename(cl::Positional, cl::desc("filename"), cl::Required);

int main(int argc, char **argv)
{
  cl::ParseCommandLineOptions(argc, argv, "TESLA Extract Utility\n");

  std::ifstream ifs{InputFilename, std::ios::binary};
  if(!ifs.is_open()) {
    tesla::panic("Couldn't open input file");
  }

  auto header = std::array<char, 20>{};
  
  ifs.read(&header[0], 20);
  int offset = header[8] | (header[9] << 8) | (header[10] << 16) | (header[11] << 24);
  auto manifest_len = offset - 20;

  auto data = std::vector<char>(manifest_len);
  ifs.read(&data[0], manifest_len);

  std::string manifest(std::begin(data), std::end(data));
  outs() << manifest.c_str();

  return 0;
}
