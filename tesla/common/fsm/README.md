# FSM

A small C++ template implementation of finite state machines that can be used to
accept or reject input sequences.

## Usage

The library is implemented as a single C++ header. To use it, copy it into your
project and include it as:
```
#include "finite_state_machine.h"
```
A finite state machine that accepts integers can then be created by:
```
auto machine = FiniteStateMachine<int>{};
```

## Future Improvements

* Generated documentation and interface cleanup
* Tests (unit, integration)
* Nicer Dot output
* Improving template compile times by splitting template-specific and
  non-specific code.
