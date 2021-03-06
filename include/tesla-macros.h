/** @file tesla-macros.h    Macros to prettify TESLA names. */
/*
 * Copyright (c) 2013 Jonathan Anderson
 * All rights reserved.
 *
 * This software was developed by SRI International and the University of
 * Cambridge Computer Laboratory under DARPA/AFRL contract (FA8750-10-C-0237)
 * ("CTSRD"), as part of the DARPA CRASH research programme.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#ifndef	TESLA_MACROS_H
#define	TESLA_MACROS_H

#include <sys/cdefs.h>

__BEGIN_DECLS

/**
 * @addtogroup ConsumerAPI
 * @{
 */

#include <tesla.h>

/*
 * Macros to make TESLA assertions a little easier to read.
 */

/** An assertion made within the execution of a particular function. */
#define	TESLA_WITHIN(function, expression)				\
	TESLA_PERTHREAD(						\
		callee(call(function)),					\
		callee(returnfrom(function)),				\
		expression						\
	)

/** An inline assertion. */
#define	TESLA_ASSERT(locality, start, end, expression)			\
	__tesla_inline_assertion(					\
		"", __FILE__, __LINE__, __COUNTER__,			\
		locality, start, end, expression			\
	)

/** An assertion in the global TESLA context. */
#define	TESLA_GLOBAL(...)	TESLA_ASSERT(__tesla_global, __VA_ARGS__)

/** An assertion in a thread's TESLA context. */
#define	TESLA_PERTHREAD(...)	TESLA_ASSERT(__tesla_perthread, __VA_ARGS__)

/** An epsilon transition in a a TESLA NFA; a non-event. */
#define TIGNORE			__tesla_ignore

/** A strictly-ordered sequence of events. */
#define	TSEQUENCE(...)		__tesla_sequence(TIGNORE, __VA_ARGS__)

#define	call(...)		__tesla_call(((void) __VA_ARGS__, TIGNORE))
#define	returnfrom(...)		__tesla_return(((void) (__VA_ARGS__), TIGNORE))

#define	callee(...)		__tesla_callee(TIGNORE, __VA_ARGS__)
#define	caller(...)		__tesla_caller(TIGNORE, __VA_ARGS__)
#define	strict(...)		__tesla_strict(TIGNORE, __VA_ARGS__)
#define	conditional(...)	__tesla_conditional(TIGNORE, __VA_ARGS__)

#define	flags(...)		__tesla_flags(__VA_ARGS__)
#define	bitmask(...)		__tesla_mask(__VA_ARGS__)

#define	TESLA_ASSERTION_SITE	__tesla_assertion_site


#define	TESLA_STRUCT_AUTOMATON(...)	__tesla_struct_usage(__VA_ARGS__)

#define automaton(name, ...)	__tesla_automaton(name, __VA_ARGS__)
#define	tesla_done		__tesla_done()

#define	optional(...)		__tesla_optional(TIGNORE, __VA_ARGS__)
#define	ANY_REP			__TESLA_INFINITE_REPETITIONS
#define	REPEAT(m, n, ...)	__tesla_repeat(m, n, __VA_ARGS__)
#define	UPTO(n, ...)		__tesla_repeat(1, n, __VA_ARGS__)
#define	ATLEAST(n, ...)		__tesla_repeat(n, ANY_REP, __VA_ARGS__)
#define	ANY(int_type)		__tesla_any(int_type)

/** A more programmer-friendly way to write assertions about the past. */
#define previously(...)		TSEQUENCE(__VA_ARGS__, TESLA_ASSERTION_SITE)

/** A more programmer-friendly way to write assertions about the future. */
#define eventually(...)		TSEQUENCE(TESLA_ASSERTION_SITE, __VA_ARGS__)

/** @} */

__END_DECLS

#endif	/* !TESLA_MACROS_H */
