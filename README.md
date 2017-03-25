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

## Install LLVM

TESLA depends on LLVM 3.4, both for building from source and when using the
TESLA workflow to compile programs with instrumentation added. To install these:

```
pkg install llvm34 clang34
```

Then ensure that you are able to run the LLVM executables by running a test
command (you may need to modify your `PATH` to do this):

```
llvm-config34 --libdir
```

## Build TESLA

Once LLVM is installed, TESLA can be built from source:

```
git clone https://github.com/cadets/tesla-static-analysis.git
cd tesla-static-analysis
mkdir build
cd build
cmake \
  -G Ninja \
  -DCMAKE_C_COMPILER=clang34 \
  -DCMAKE_CXX_COMPILER=clang++34 \
  -DLLVM_DIR=/usr/local/share/llvm34/cmake ..
ninja
```

I believe that `LLVM_DIR` should be detected automatically, but I haven't got
round to debugging the build system yet to work out why it isn't. Additionally,
note that the C and C++ compilers must be the ones based on LLVM 3.4.

## Installation

To install the TESLA build artefacts (by default, they will be installed to
`/usr/local`):

```
cmake -D CMAKE_INSTALL_PREFIX=/some/sensible/path .
ninja install
```

## Options

My research project into static analysis for TESLA produced a set of experiments
and investigations that can be built as part of the TESLA source tree. These are
probably not useful to an end user of TESLA, but can be enabled with:

```
cmake -DBUILD_EXPERIMENTS=On .
```
