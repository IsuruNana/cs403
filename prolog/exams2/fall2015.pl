% 1. Suppose this definition of predicate p is found in Prolog’s database:
% p(X, X).
% Determine and explain the output that would appear upon entering this query:
% ?- p(L, [a|L]).
% a. First assume that the “occurs check” is implemented in this version of Prolog.
% b. Next assume that the “occurs check” is not implemented in this version of Prolog.
% c. Why do most versions of Prolog usually omit performing the “occurs check”?

% 2. Explain why in Prolog the built-in “not” predicate and the cut (“!”) opera

% 3. Suppose a Prolog database defines relations of the form male(X), female(X), sibling(X, Y),
% spouse(X, Y), and parent(X, Y), which means that X is a parent of Y. Write these Prolog
% predicates:
% • nephew(X, Y), which means that X is a nephew of Y.
% Note: your nephew is your brother’s son, sister’s son, or spouse’s nephew.

nephew(X, Y) :- male(X), helper(X, Y).
% nephew(X, Y) :- male(X), 

helper(A, B) :- parent(A, X), sibling(B, X).
helper(A, B) :- parent(A, X), sibling(X, W), spouse(W, B).

% • niece(X, Y), which means that X is a niece of Y.
% Note: your niece is your brother’s daughter, sister’s daughter, or spouse’s niece.


% • uncle(X, Y), which means that X is an uncle of Y.
% Note: your uncle is your father’s brother, mother’s brother, or aunt’s husband.


% • aunt(X, Y), which means that X is an aunt of Y.
% Note: your aunt is your father’s sister, mother’s sister, or uncle’s wife.


% 4. Suppose a Prolog database contains only facts of the form parent(x, y), which means that X is a
% parent of Y. Write the Prolog predicate cognate(X, Y), which means that X is blood-related to Y.


% 5. Write this predicate using Prolog: function(N, Z) succeeds when Z is the dot product of lists
% [1,2,…,N–1,N] and [N,N–1,…,2,1]. Examples:
% function(5, Z) succeeds when Z = 1*5 + 2*4 + 3*3 + 4*2 + 5*1 = 35.
% function(6, Z) succeeds when Z = 1*6 + 2*5 + 3*4 + 4*3 + 5*2 + 6*1 = 56.

function(X, Z) :- helper(N, 1, 0, F).

helper(0, _, F, F).
helper(X, Y, Z, F) :- X>0, A is X-1, B is Y+1, C is (X*Y) + Z, helper(A, B, C, F).

% 6. You are given this Prolog database. Assume that append is defined in the usual way.
% predicate([ ], [ ]).
% predicate([H|T], L) :- predicate(H, X), predicate(T, Y), append(X, Y, L).
% predicate(Z, [Z]).
% Write all the solutions to Q for this Prolog query:
% ?- predicate([[ ], 0], Q).

% Q = 
% Q = 
% Q = 
% Q = 
% Q = 
% Q =


% 7. Write these two predicates using Prolog: power and log. power(M, N, Q) succeeds when Q
% is the result value obtained by raising M to the power N. log(M, Q, N) succeeds when N is
% the smallest non-negative integer such that raising M to the power N yields at least Q.
% Examples: 
% power(2, 3, Q) yields Q=8. 
% power(2, 4, Q) yields Q=16.
% log(2, 8, N) yields N=3. 
% log(2, 16, N) yields N=4. 
% log(2, 10, N) yields N=4.

power(_, 0, 1).
power(X, Y, R) :- Z is Y-1, power(X, Z, A), R is A*X.

% 8. Write a Prolog predicate eval(Expression, Result) that evaluates a prefix Boolean expression
% over constant values {true, false} and logical operations {not, and, or}. Examples:
% eval(or(false, and(true, not(false))), X) succeeds with X = true.
% eval(and(true, or(false, not(true))), Y) succeeds with Y = false.

% 9. Write a Prolog predicate isTrue(Expression, List) that succeeds iff the given prefix Boolean
% expression evaluates to true in an environment where the variables in the given list are true
% and all other variables are assumed to be false. Examples:
% isTrue(or(a, and(b, not(c))), [b]) succeeds.
% isTrue(or(a, and(b, not(c))), [b,c]) fails.
% isTrue(or(a, and(b, not(c))), [a,b,c]) succeeds.
% isTrue(and(x, or(y, not(z))), [x]) succeeds.
% isTrue(and(x, or(y, not(z))), [x,z]) fails.
% isTrue(and(x, or(y, not(z))), [x,y,z]) succeeds.

% 10. Explain the differences between imperative programming and declarative programming. Also
% explain the differences between procedural programming, functional programming, objectoriented
% programming, and logic programming. Specify the relevant features that are
% characteristic of each paradigm, that is, the features that must be present in any programming
% language that fully supports the paradigm.


% 11. Write this predicate using Prolog: merge_sort(X, Y) succeeds if Y is the list that is obtained
% by sorting the elements of list X into ascending order. Your code must use the merge sort
% algorithm. Do not use any other sorting algorithm such as insertion sort, selection sort, or
% quick sort. Example: merge_sort([9, 5, 2, 7, 4, 0], L) succeeds with L = [0, 2, 4, 5, 7, 9]. 
