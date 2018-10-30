# Problem 1 is a tracing problem with its own instructions. For the remaining problems 2 through 10,
# write the given predicates using Prolog, including any non-standard helper predicates that you use.
# You will likely need to use most of these standard predicates, operators, and other Prolog features:
# +, -, *, div, mod, max, min, is, =, \=, =:=, =\=, <, =<, >, >=, pattern matching, atom, number, atomic,
# lists and nested lists, append, reverse, last, member, length, the cut (!), not (or \+), fail, write, nl.

# 1. Given this Prolog database:
# a(X) :- write(X), nl.
# b(_).
# b(X) :- a(X), fail.
# q :- member(X, [2,3]), a(try(x, X)), b(nix(x, X)), member(Y, [4,3]), a(try(y, Y)), b(nix(y, Y)), X > Y.
# Write the output exactly as it would
# Write these predicates using Prolog, including any non-standard helper predicates that you use:


# 2. twist(L, R) reverses the top level of list L, and recursively twists every nested sublist. Example:
# twist([1,2,[a,b],[3,[4,c],d],[[e,f],[5,6]],g,7], R) returns R = [7,g,[[6,5],[f,e]],[d,[c,4],3],[b,a],2,1].


# 3. mysqrt(N, R) returns the truncated square root of non-negative integer N. Do not use the
# built-in “sqrt” or ** functions. Example: mysqrt(31, R) returns R = 5. For full credit, your
# function should be efficient. Hint: Use a helper predicate that does binary search in the
# range 0 to N. For half credit, use a less efficient linear search.


# 4. factorize(N, R) returns a list of all the prime factors whose product yields the positive integer N.
# Examples: factorize(360, R) returns R = [2,2,2,3,3,5], and factorize(361, R) return R = [19,19].
# For full credit, your function should be efficient. Hint: Use a helper predicate that checks
# possible factors in the range 2 to √N.


# 5. countall(L, R) counts the total number of values within all nested levels of L that are not lists.
# Example: countall([a,b,[c,[ ],[d]],[[e,[f],[[g]],[ ]],h]], R) returns R = 8.


# 6. powerset(S, R) takes a set S represented as a list, and returns a list with all the subsets of S. Your
# predicate may arrange each list in any order, because the order of elements within a set does
# not matter. Example: powerset([a,b,c], R) returns R = [[a,b,c], [a,b], [a,c], [a], [b,c], [b], [c], [ ]].


# 7. level(N, L, R) returns a list of all the non-list values that are nested N levels deep within L.
# Examples: If L = [a, [6, b], [ ], 7, [[c], [8]], [d, 9], [[ ]], e] then:
# level(0, L, R) returns R = [ ].
# level(1, L, R) returns R = [a, 7, e].
# level(2, L, R) returns R = [6, b, d, 9].
# level(3, L, R) returns R = [c, 8].
# level(4, L, R) returns R = [ ].


# 8. distinct(L) succeeds iff all the values in list L are different from each other, and disjoint(L1, L2)
# succeeds iff all the values in list L1 are different from all the values in list L2. Examples:
# distinct([a,b,c,d,e]) returns true, and distinct([a,b,c,d,b,e]) returns false.
# disjoint([a,b,a,c], [d,e,f,e]) returns true, and disjoint([a,b,c,d], [e,c,f,g]) returns false.


# 9. Suppose a Prolog database defines family relations of the form sibling(X, Y), spouse(X, Y),
# and parent(X, Y), which means that X is a parent of Y. Define these two new predicates:
# parent_in_law(X, Y) and sibling_in_law(X, Y).


# 10. Suppose a Prolog database defines family relations of the form sibling(X, Y), spouse(X, Y),
# and parent(X, Y), which means that X is a parent of Y. Define these three new predicates:
# step_parent(X, Y), half_sibling(X, Y), and step_sibling(X, Y).