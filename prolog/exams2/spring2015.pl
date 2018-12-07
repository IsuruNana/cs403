% 1. Write this predicate using Prolog: inner(X,Y,Z) succeeds when Z is the inner product of
% lists X and Y with respect to binary operations + and *. This kind of inner product is also
% called a dot product. You may assume that lists X and Y have the same length. Example:
% inner([1,2,3], [4,5,6], 32), because 1*4+2*5+3*6 = 32.

inner([], [], 0).
inner([A|B], [C|D], R) :- inner(B, D, X), R is X + A*C.

% 2. Write this predicate using Prolog: outer(X,Y,Z) succeeds when Z is the outer product of lists X
% and Y with respect to binary operation *. This kind of outer product is also called a
% multiplication table. Here Z is a list with same length as X, each of whose elements is a sublist
% with same length as Y. The kth element of the j
% th sublist is obtained by multiplying the j
% th
% element of X and the kth element of Y. Example: outer([1,2,3], [4,5,6,7],
% [[4,5,6,7],[8,10,12,14],[12,15,18,21]]).

outer([], _, []).
outer([A|B], Y, [C|D]) :- getRow(A, Y, C), outer(B, Y, D).

getRow(_, [], []).
getRow(A, [H|T], [X|Y]) :- X is A*H, getRow(A, T, Y).

% 3. Write this predicate using Prolog: scan(L, Q) succeeds if L and Q are lists of numbers, and Q is
% obtained by summing each possible prefix of L. Example: scan([2,3,5,7,11,13], Q) succeeds
% with Q = [0,2,5,10,17,28,41].

% scan([], [0]).
% scan([H|T], [0|Z]) :- scan(T, Y), scan2(H, Y, Z).

% scan2([], _, []).
% scan2([H|T], X, [X|Y]) :- Y is H+X, scan2(T, Y, ) 

% 4. Suppose a Prolog database currently contains only facts of the form parent(x, y), which
% means that x is a parent of y. Write Prolog rules for each of the following:
% • child(A, B), which means that A is a child of B.
% • grandchild(A, B), which means that A is a grandchild of B.
% • sibling(A, B), which means that A is a brother or sister of B.
% • cousin(A, B), which means that A is a (first) cousin of B.
% • ancestor(A, B), which means that A is an ancestor of B.
% • descendant(A, B), which means that A is a descendant of B.


% 5. List five (or more) most significant ways that Prolog is not a pure logic programming
% language, and/or that Prolog does not provide the full power of logic.

% 6. Write this predicate using Prolog: prime(N) succeeds if N is a prime number. Examples:
% prime(11) succeeds, but prime(12) fails.

% 7. Write this predicate using Prolog: selection_sort(X, Y) succeeds if Y is the list that is
% obtained by sorting the elements of list X into ascending order. Your code must use the
% selection sort algorithm, which at each step locates the smallest remaining value and places
% it at its correct position in the list. Do not use any other sorting algorithm such as insertion
% sort, merge sort, or quick sort. Example: selection_sort([9, 5, 2, 7, 4, 0], L) succeeds with L
% = [0, 2, 4, 5, 7, 9].

% 8. Write this predicate in Prolog: sublistSum (L, N, S) succeeds if S is a sublist of list L and the
% sum of the values in S is N. Example: sublistSum([7,3,4,6,1], 12, S) succeeds with S =
% [7,4,1]. Note that L and N are the input values and S is the output value.

% 9. Write this predicate in Prolog: disjoint(X, Y) succeeds if lists X and Y contain none of the
% same values. Examples: disjoint([5,1,9,3,7], [2,6,0,8,4]) succeeds, but
% disjoint([5,1,9,3,7], [2,6,3,0,8,4]) fails. Do not assume the existence of any predefined
% predicates that operate on lists.

disjoint([], []).
disjoint([A|B], C) :- not(member(A, C)), disjoint(B, C).

member(H, [H|_]).
member(A, [_|T]) :- member(A, T).

% 10. Write this predicate using Prolog: diagonal(M, D) succeeds if M is a matrix stored as a
% list of row lists, and D is a list of its main diagonal elements. Example:
% diagonal([[a,b,c],[d,e,f],[g,h,i]], D) succeeds with D = [a,e,i].
% �
% a b c
% d e f
% g h i
% �

diagonal([], []).
diagonal([[H|_]|T2], [H|B]) :- chopOff(T2, A), diagonal(A, B).

chopOff([], []).
chopOff([[_|T]|T2], [T|B]) :- chopOff(T2, B). 

% 11. Write this predicate using Prolog: eval(E, Z) succeeds if Z is the value of expression E.
% Here an expression is essentially a binary tree with leaves labeled “num( _ )” and
% internal nodes labeled “add( _,_ )”, “sub( _,_ )”, “mul( _,_ )”, or “div( _,_ )”. Example:
% eval(mul(add(num(4),num(7)), sub(num(5),num(2))), Z) succeeds with Z = (4+7)*(5-2) = 33. 


% 12. Given this Prolog database:
% split(P, Q, L) :- append(P, Q, L), alldiff(P, Q).
% append([ ], Y, Y).
% append([H|T], Y, [H|Z]) :- append(T, Y, Z).
% alldiff([ ], [ ]).
% alldiff([H|T], [X|Y]) :- diff(H, X), alldiff(T, Y).
% diff(a, b).
% diff(b, a).
% Draw the proof tree or search tree that Prolog constructs to satisfy this query:
% split(M, N, [a,b,b,a,b,a,a,b]). Do not show parts of the search that lead only to dead ends
% and backtracking, but do show all nodes of the search that contribute to proving the query
% is satisfied. Also, specify the values of M and N for which this query succeeds.