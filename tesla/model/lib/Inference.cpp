#include "Inference.h"

Condition *ConstTrue::Simplified() const {
  return new ConstTrue;
}

Condition *Branch::Simplified() const {
  return new Branch(*this);
}
