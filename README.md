# TESLA: Temporally Enforced Security Logic Assertions

TESLA is a tool that allow programmers to add temporal assertions to
their security-critical code. Rather than simply asserting that
"a particular expression evaluates to true right now", programmers
can specify temporal properties such as "this access control check
occurs before that object is used".

A programmer's guide (including build instuctions) can be found at:
http://www.cl.cam.ac.uk/research/security/ctsrd/tesla

# Static Analysis Extensions

As part of my Part III research project, I will be investigating how static
analysis can be used to optimise TESLA assertions.

This repository is set up as a clone of the main TESLA repository, and can be
updated from there. My work will initially be pushed only to this repository
(while my project is in progress).

# Build Instructions

Currently building TESLA from source is a fairly involved task that is currently
only known to work reliably on FreeBSD 11. In the future I aim to improve the
portability of TESLA so that it can be built and installed more easily by users.

## Dependencies

* **LLVM 4.0**: this is the latest stable version of LLVM - it can be installed
  from source or from a package manager (Homebrew, pkg, etc.)
* **Z3**
* **Protobuf**

## Build TESLA

Once all dependencies are installed, TESLA can be built from source:

```
git clone https://github.com/cadets/tesla-static-analysis.git
cd tesla-static-analysis
mkdir build
cd build
cmake \
  -D LLVM_DIR=<llvm cmake directory> \
  -D CMAKE_LLVM_CONFIG=<path to llvm-config> \
  -D CMAKE_LLVM_LIT=<path to llvm-lit> \
  ..
make
```

In order to build against LLVM, TESLA has to be pointed to the correct
locations. If LLVM is installed globally, it's possible that these will be
discovered automatically.

## Installation

To install the TESLA build artefacts (by default, they will be installed to
`/usr/local`):

```
cmake -D CMAKE_INSTALL_PREFIX=/some/sensible/path .
make install
```

## Building Documentation

Building TESLA documentation is disabled by default, but it can be enabled
using:
```
cmake -D BUILD_DOCS=On .
```
This requires some extra dependencies:
* **Doxygen**
* **ucampas**

# Programming with TESLA

Once TESLA is installed, we can start to write programs that include TESLA
assertions.
