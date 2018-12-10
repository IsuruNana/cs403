% P01 (*) Find the last element of a list.
% Example:
% ?- my_last(X,[a,b,c,d]).
% X = d

my_last(H, [H|[]]).
my_last(X, [_|T]) :- my_last(X, T).

% P02 (*) Find the last but one element of a list.
% (zweitletztes Element, l'avant-dernier élément)

% last_but_one(H, [])

% P03 (*) Find the K'th element of a list.
% The first element in the list is number 1.
% Example:
% ?- element_at(X,[a,b,c,d,e],3).
% X = c

% element_at(H, [H|_], I).
% element_at(X, [H|T], I) :- J is I+1, element_at(X, T, J).

element_at(X, L, I) :- find_element_help(L, I, 0, X).

find_element_help([H|_], I, I, H).
find_element_help([_|T], I, J, R) :- K is J+1, find_element_help(T, I, K, R).

% P04 (*) Find the number of elements of a list.

num_elems([], 0).
num_elems([_|T], N) :- num_elems(T, R), N is R+1.

% P05 (*) Reverse a list.

reverse_list(L1, L2) :- do_rev(L1, L2, []).

do_rev([], L2, L2) :- !.
do_rev([X|Y], L2, R) :- do_rev(Y, L2, [X|R]).

%Execution

% reverse_list([1, 2, 3], _) = do_rev([1, 2, 3], _, [])
%   -->
%   do_rev[[1 | [2, 3]], _, []] = do_rev([2, 3], _, [1|[]]).
%   do_rev[[2 | [3  ]], _, [1]] = do_rev([3],    _, [2|[1]).
%   do_rev[[3 | []], _, [2, 1]] = do_rev([], _, [3|[2, 1]]).
%   do_rev([], _, [3, 2, 1]).

%   L2 = [3, 2, 1]


% P06 (*) Find out whether a list is a palindrome.
% A palindrome can be read forward or backward; e.g. [x,a,m,a,x].

% is_palindrome(L1)

% P07 (**) Flatten a nested list structure.
% Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

% Example:
% ?- my_flatten([a, [b, [c, d], e]], X).
% X = [a, b, c, d, e]

% Hint: Use the predefined predicates is_list/1 and append/3


% P08 (**) Eliminate consecutive duplicates of list elements.
% If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

% Example:
% ?- compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
% X = [a,b,c,a,d,e]


% P09 (**) Pack consecutive duplicates of list elements into sublists.
% If a list contains repeated elements they should be placed in separate sublists.

% Example:
% ?- pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
% X = [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]


% P10 (*) Run-length encoding of a list.
% Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as terms [N,E] where N is the number of duplicates of the element E.

% Example:
% ?- encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
% X = [[4,a],[1,b],[2,c],[2,a],[1,d][4,e]]



% 1.17 (*) Split a list into two parts; the length of the first part is given.
% Do not use any predefined predicates.

% Example:
% ?- split([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
% L1 = [a,b,c]
% L2 = [d,e,f,g,h,i,k]

splitList(L, 0, [], L).
splitList([H|T], I, [H|A], B) :- X is I-1, splitList(T, X, A, B).

% 1.18 (**) Extract a slice from a list.
% Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included). Start counting the elements with 1.

% Example:
% ?- slice([a,b,c,d,e,f,g,h,i,k],3,7,L).
%  L = [c,d,e,f,g]

slice(L, I, J, L3) :- Y is I-1, splitList(L, Y, L1, L2), Z is J-I+1, splitList(L2, Z, L3, L4).


% 1.19 (**) Rotate a list N places to the left.
% Examples:
% ?- rotate([a,b,c,d,e,f,g,h],3,X).
% X = [d,e,f,g,h,a,b,c]

% ?- rotate([a,b,c,d,e,f,g,h],-2,X).
% X = [g,h,a,b,c,d,e,f]

rotate(L, I, R) :- I > 0, splitList(L, I, L1, L2), append(L2, L1, R).
rotate(L, I, R) :- length(L, Len), Y is Len + I, splitList(L, Y, L1, L2), append(L2, L1, R).

% 1.21 (*) Insert an element at a given position into a list.
% Example:
% ?- insert_at(alfa,[a,b,c,d],2,L).
% L = [a,alfa,b,c,d]

insert_at(Elem, L, I, R) :- Y is I-1, splitList(L, Y, L1, L2), append(L1, [Elem], Z), append(Z, L2, R).