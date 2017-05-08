/**
 * @file bitmask.c
 * Check parsing of flags combined in a bitmask.
 *
 * TODO: parsing flag names from macro expansions is broken at the moment
 *
 * RUN: tesla analyse -S %s -o %t -- %cflags
 * RUN: %filecheck -input-file=%t %s
 */

#include <tesla-macros.h>

int	foo(int);

#define	FOO	0x1
#define	BAR	0x2
#define	BAZ	0x4

void context() {
	foo(FOO | BAR | BAZ);
	foo(FOO);

	/*
	 * CHECK:       automaton {
	 * CHECK-NEXT:    identifier {
	 * CHECK-NEXT:      location {
	 * CHECK-NEXT:        filename: "{{.*}}/bitmask.c"
	 * CHECK:           }
	 * CHECK:         }
	 * CHECK:         expression {
	 */
	TESLA_WITHIN(context,
		TSEQUENCE(
			/*
			 * CHECK:       expression {
			 * CHECK:         type: FUNCTION
			 * CHECK-NEXT:    function {
			 * CHECK-NEXT:      function {
			 * CHECK-NEXT:        name: "foo"
			 * CHECK:           }
			 * CHECK:           context: Callee
			 * CHECK:           argument {
			 * CHECK-NEXT:        type: Constant
			 * CHECK-NEXT:        value: 3
			 * CHECK-NEXT:        constantMatch: Flags
			 * CHECK:           }
			 * CHECK:         }
			 * CHECK:       }
			 */
			foo(flags(BAR | FOO)) == 0,

			/*
			 * CHECK:       expression {
			 * CHECK:         type: FUNCTION
			 * CHECK-NEXT:    function {
			 * CHECK-NEXT:      function {
			 * CHECK-NEXT:        name: "foo"
			 * CHECK:           }
			 * CHECK:           context: Callee
			 * CHECK:           argument {
			 * CHECK-NEXT:        type: Constant
			 * CHECK-NEXT:        value: 5
			 * CHECK-NEXT:        constantMatch: Mask
			 * CHECK:           }
			 * CHECK:         }
			 * CHECK:       }
			 */
			foo(bitmask(FOO | BAZ)) == 0
		)

	);
}
