1. invfact(F, R) computes the inverse of factorial. That is, invfact(F, R) returns the largest integer R
such that R! ≤ F. Examples: the query invfact(24, R) yields R = 4, and the query invfact(23, R)
yields R = 3. [20 points]

invfact(F, R) :- getFactorialList(F, 1, FactList), getHighest(FactList, R).

% getFactorialList(0, [1]).
getFactorialList(F, F, []).
getFactorialList(F, I, R) :- 0 is mod(F, I), J is I+1, getFactorialList(F, J, A), append(A, [I], R).
getFactorialList(F, I, R) :- 1 is mod(F, I), J is I+1, getFactorialList(F, J, R).

% 

invfact(F, R) :- helper(F, 1, R).

helper(1, _, 1)
helper(F, I, R) :- Y 

% 2. even_length(L) succeeds iff L is a list with even length, and odd_length(L) succeeds iff L is a list
% with odd length. Examples: even_length([a,b,c,d]) and odd_length([a,b,c,d,e]) succeed, but
% even_length([a,b,c,d,e]) and odd_length([a,b,c,d]) fail. Restriction: for this problem, you must
% not use any numeric values, so do not use any arithmetic operations and do not use the
% “length” predicate. [20 points]

even_length([H|[H1|[]]).
even_length([H|[H1|T]]) :- even_length(T).

odd_length([_|[]]).
odd_length([_,_| T]) :- odd_length(T).

% 3. removeDup(L, R) removes all the duplicate values from the list L, and returns the result in list R.
% Example: the query removeDup([a,b,c,a,d,d,b,e,f,c,a,a,f,e], R) yields R = [a,b,c,d,e,f] or any other
% permuation of this list. [20 points]

% removeDup([], []).
% removeDup([H|T], R) :- removeDup(T, X), not(member(H, X)), append(X, [H], R).
% removeDup([H|T], R) :- member(H, X), removeDup(T, X).

removeDup(L, R) :- help(L, [], R).

help([], L, L).
help([H|T], A, B) :- not(member(H, A)), append(A, [H], Y), help(T, Y, B).
help([H|T], A, B) :- help(T, A, B).

% 4. levelorder(T, L) takes tree T which is represented using a nested list as in the examples below,
% and it returns the nodes of the level-order traversal of T in the list L. Examples:
% levelorder([1,[2,[3],[4]],[5,[6],[7]]], L) yields L = [1,2,5,3,4,6,7].
% levelorder([a,[b,[e],[f,[k],[m]]],[c,[g]],[d,[h,[n],[p]],[j]]], L) yields L = [a,b,c,d,e,f,g,h,j,k,m,n,p].
% Hint: use a list to maintain a queue of subtrees yet to be traversed. [20 points]
%       1
%   2       5
% 3   4   6   7

%                 a
%         b       c       d
%     e    f      g     h    j  
%         k m         n   p
            


% 5. Peano arithmetic represents whole numbers using the successor function s( ). Therefore s(0)
% represents 1, s(s(0)) represents 2, s(s(s(0))) represents 3, s(s(s(s(0)))) represents 4, etc. [60 points]


% a. convert(P, R) converts Peano number P to whole number R. Example: convert(s(s(s(0))), R)
% yields R = 3.


% b. less(X, Y) succeeds iff Peano number X is smaller than Peano number Y. Examples:
% less(s(s(0)), s(s(s(s(0))))) succeeds, but less(s(s(s(s(0)))), s(s(0))) fails. Do not use any
% arithmetic operators such as +, -, *, /, div, mod, =, <, >, etc.


% c. add(X, Y, R) adds the Peano numbers X and Y, and returns the result in Peano number R.
% Example: add(s(s(0)), s(s(s(0))), R) yields R = s(s(s(s(s(0))))). Do not use any arithmetic
% operators such as +, -, *, /, div, mod, =, <, >, etc.


% d. diff(X, Y, R) takes the absolute difference of the Peano numbers X and Y, and returns the result
% in Peano number R. Examples: diff(s(s(s(0))), s(s(0)), R) and diff(s(s(0)), s(s(s(0))), R) each yield
% R = s(0). Do not use any arithmetic operators such as +, -, *, /, div, mod, =, <, >, etc.


% e. mult(X, Y, R) multiplies the Peano numbers X and Y, and returns the result in Peano
% number R. Example: mult(s(s(0)), s(s(s(0))), R) yields R = s(s(s(s(s(s(0)))))). Do not use
% any arithmetic operators such as +, -, *, /, div, mod, =, <, >, etc.


% f. divmod(X, Y, Q, R) divides the Peano numbers X and Y, and returns the quotient and
% remainder in Peano numbers Q and R respectively. Example: divmod(s(s(s(s(s(s(s(0))))))),
% s(s(s(0))), Q, R) yields Q = s(s(0)) and R = s(0). Do not use any arithmetic operators such as
% +, -, *, /, div, mod, =, <, >, etc.