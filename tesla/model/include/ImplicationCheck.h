#ifndef IMPLICATION_CHECK_H
#define IMPLICATION_CHECK_H

#include "Inference.h"

namespace Implication {

/**
 * Check if the condition c implies that the branch condition b holds.
 *
 * The algorithm used for this is:
 *  - Generate all possible valuations of c with respect to the other branches
 *    it contains (i.e. not b), so that the only degree of freedom left is b.
 *  - Then, check the implication c ==> b by taking the contrapositive ~b ==> ~c
 *    and checking on all the possible valuations generated (i.e. set b to false
 *    and check that every valuation then evals to false as well).
 */
bool Check(Condition *c, Branch *b);

}

#endif
