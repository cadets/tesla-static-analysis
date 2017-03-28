#ifndef BACKWARDS_SEARCH_H
#define BACKWARDS_SEARCH_H

#include "Inference.h"

namespace BackwardsSearch {

// Search backwards from the given BoolValue, trying to resolve any data
// dependencies we know how to along the way. Stops when a CallInst is found,
// and returns nullptr if we hit an unresolvable point in the search.
BoolValue *From(BoolValue b);

// Try to resolve the given BoolValue into a "next step".
BoolValue *Resolve(BoolValue b);

}

#endif
