loves(romeo, juliet).

loves(juliet, romeo) :- loves (romeo, juliet).

% Question
% loves(romeo, X).
% returns
% X = juliet

male(albert).
male(bob).
male(charlie).
male(dan).
male(eddy).

female(alice).
female(betsy).
female(cynthia).

happy(albert).
happy(alice).

with_albert(alice).

% near_water(bob).

runs(albert) :- 
  happy(albert).

dances(alice) :-
  happy(alice),
  with_albert(alice).

does_alice_dance :- dances(alice),
  write('When Alice is happy and with Albert she dances').

swims(bob) :-
  happy(bob),
  near_water(bob).


