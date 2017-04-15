#include <array>
#include <fstream>

#include <sys/stat.h>

#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/SourceMgr.h>

#include "Debug.h"
#include "Manifest.h"

using namespace llvm;

static cl::opt<std::string>
BitcodeFilename(cl::Positional, cl::desc("<bitcode>"), cl::Required);

static cl::opt<std::string>
ManifestFilename(cl::Positional, cl::desc("<manifest>"), cl::Required);

static cl::opt<std::string>
OutputFilename("o", cl::init("-"), cl::desc("Specify output filename"), cl::value_desc("filename"));

long get_file_size(std::string name)
{
  struct stat stat_buf;
  int rc = stat(name.c_str(), &stat_buf);
  return rc == 0 ? stat_buf.st_size : -1;
}

uint8_t get_component(int n, long val)
{
  return (val & (0xFF << (8*n))) >> (8*n);
}

int main(int argc, char **argv)
{
  SMDiagnostic Err;
  LLVMContext &Context = getGlobalContext();

  cl::ParseCommandLineOptions(argc, argv, "TESLA Archive Utility\n");

  long manifest_len = get_file_size(ManifestFilename);
  if(manifest_len < 0) {
    tesla::panic("Couldn't stat manifest file");
  }
  auto pad = 4 - (manifest_len % 4);
  manifest_len += pad;

  long bitcode_len = get_file_size(BitcodeFilename);
  if(bitcode_len < 0) {
    tesla::panic("Couldn't stat bitcode file");
  }

  auto header = std::array<uint8_t, 20>{};
  header[0] = 0xDE; header[1] = 0xC0;
  header[2] = 0x17; header[3] = 0x0B;
  for(auto i = 0; i < 4; i++) { header[8+i] = get_component(i, manifest_len+20); }
  for(auto i = 0; i < 4; i++) { header[12+i] = get_component(i, bitcode_len); }

  std::ofstream os{OutputFilename, std::ios::binary};
  std::copy(std::begin(header), std::end(header),
            std::ostreambuf_iterator<char>(os));

  std::ifstream mis{ManifestFilename, std::ios::binary};
  std::copy(std::istreambuf_iterator<char>(mis),
            std::istreambuf_iterator<char>(),
            std::ostreambuf_iterator<char>(os));

  for(auto i = 0; i < pad; i++) { os << '\0'; }

  std::ifstream bis{BitcodeFilename, std::ios::binary};
  std::copy(std::istreambuf_iterator<char>(bis),
            std::istreambuf_iterator<char>(),
            std::ostreambuf_iterator<char>(os));

  return 0;
}
