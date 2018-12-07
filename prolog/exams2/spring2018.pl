% # Write each predicate below in Prolog, including any non-standard helper predicates that you use.
% # You may assume that the “not” predicate is provided.

% # 1. fun(L, R) computes the sum of the fourth powers of all the odd positive numbers in the list L,
% # and returns the result in R. Example: the query fun([2,3,-2,6,5,-3], R) yields R = 34 + 54 = 706.

fun([], 0).
fun([H|T], R) :- H > 0, 1 is mod(H, 2), fun(T, X), Y is H*H*H*H, R is Y+X, !.
fun([_|T], R) :- fun(T, R).

% # 2. evalpoly(P, V, R) takes a polynomial with coefficients given in list P, and evaluates it at V. Example:
% # The list [2,3,5,6,8,9] denotes polynomial 2 + 3x + 5x2 + 6x3 + 8x4 + 9x5, therefore the query
% # evalpoly([2,3,5,6,8,9],10,R) yields R = 2 + 3*10 + 5*102 + 6*103

evalpoly(P, V, R) :- evalAt(P, V, 0, R).

evalAt([], _, _, 0).
evalAt([H|T], V, I, R) :- Y is I+1, evalAt(T, V, Y, Z), R is Z + H*(V**I).

% # 3. transpose(M, R) constructs the transpose of matrix M, which is represented as a list of lists,
% # and returns the result in R. Example: the query
% # transpose([[1,2,3],[4,5,6],[7,8,9],[10,11,12]],R) yields R = [[1,4,7,10],[2,5,8,11],[3,6,9,12]].

transpose([[]|_], []) :- !.
transpose(L, [A|B]) :- getHeads(L, M, A), transpose(M, B).

getHeads([], [], []).
getHeads([[H|T]|T2], [T|B], [H|Y]) :-  getHeads(T2, B, Y).

% # 4. In a game of nim, two players alternate turns, and each turn consists of removing stones from
% # a pile. Each player may remove either 1 stone or n/2 stones, where n is the current number
% # of stones in the pile. The winner is the player who removes the last remaining stone.
% # win(X, Y) succeeds iff there is a winning strategy for the current player in a game of nim such
% # that the pile currently has X stones, and if so, it returns the number of stones that the current
% # player should remove in Y. The table below summarizes some examples of the query win(X,Y):
% # X 1 2 3 4 5 6 7 8 9 10
% # Y 1 fails 1 2 fails 1 fails 1 4 5



% # 5. CS 403: Two people are kth cousins if each has an ancestor k generations back which are
% # siblings. For example, 1st cousins are children of siblings. Suppose a Prolog database
% # defines only family relations of the form parent(X,Y) which means that X is a parent of Y.
% # Write the new predicate cousin(K,X,Y) which means that X and Y are Kth cousins.

% # CS 503: First do as explained for CS 403 above, and next continue as follows. Two people
% # are kth cousins m times removed if one has an ancestor m generations back which is kth
% # cousin of the other. Again suppose a Prolog database defines only family relations of the
% # form parent(X,Y) which means that X is a parent of Y. Write the new predicate
% # cousin_removed(K,M,X,Y) which means that X and Y are Kth cousins M times removed.


% # 6. CS 403: evaluate(X, R) evaluates an expression X that will only include operations add, sub,
% # mul, neg, and integer values, and returns the result in R. Example: the query
% # evaluate(mul(add(3,4),sub(8,neg(2))),R) yields R = (3+4)*(8-(-2)) = 70.

% # CS 503: evaluate(X, L, R) evaluates an expression X that will only include operations add, sub,
% # mul, neg, integer values, and identifiers, and returns the result in R. List L contains pairs of
% # identifiers and their integer values. Example: the query
% # evaluate(mul(add(w,x),sub(y,neg(z))),[[w|3],[x|4],[y|8],[z|2]],R) yields R = (3+4)*(8-(-2)) = 70.