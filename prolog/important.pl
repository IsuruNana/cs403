maxDepth([], 1) :- !.
maxDepth(X, 0) :- atomic(X), !.
maxDepth([H|T], R) :- map(maxDepth, L, X), foldl(max,0,X,Y), R is Y+1.

foldl(_,X,[],X) :- !.
foldl(F,I,[H|T],R) :- call(F,I,H,X), foldl(F,X,T,R).

map(_, [], []) :- !.
map(F, [H|T], [X|Rs]) :- call(F,H,X), map(F,T,Rs).