:- use_module(library(clpfd)).

sudoku(Rows) :-
        length(Rows, Length), maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..Length,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        % Rows = [_,Bs,_,_,_,_,_,_,_],
        % vejoCerto(Bs, 5).

quantosVejo([], 0).
quantosVejo(Lista, V) :- quantosVejoRecursivo(Lista, -1, V).

quantosVejoRecursivo([], _, 0).
quantosVejoRecursivo([H|T], Max, V) :- H #> Max, quantosVejoRecursivo(T, H, V1), V is V1 + 1, !.
quantosVejoRecursivo([_|T], Max, V1) :- quantosVejoRecursivo(T, Max, V1).

inverte([], []).
inverte([H|T], I) :- inverte(T, I1), append(I1, [H], I).

vejoCerto(Lista, V) :- quantosVejo(Lista, V).

soma([], 0).
soma([H|T], S) :- soma(T, S1), S is S1 + H.

problem(1, [[_,_,_,_,_,_,_,_,_],
            [_,_,_,_,_,3,_,8,5],
            [_,_,1,_,2,_,_,_,_],
            [_,_,_,5,_,7,_,_,_],
            [_,_,4,_,_,_,1,_,_],
            [_,9,_,_,_,_,_,_,_],
            [5,_,_,_,_,_,_,7,3],
            [_,_,2,_,1,_,_,_,_],
            [_,_,_,_,4,_,_,_,9]]).

% ?- vejoCerto([A,B,C,D,E], 4), A in 1..5, B in 1..5, C in 1..5, D in 1..5, E in 1..5, all_distinct([A,B,C,D,E]), label([A,B,C,D,E]).


% [9, 8, 7, 6, 5, 4, 3, 2, 1].
% [2, 4, 6, 1, 7, 3, 9, 8, 5].
% [3, 5, 1, 9, 2, 8, 7, 4, 6].
% [1, 2, 8, 5, 3, 7, 6, 9, 4].
% [6, 3, 4, 8, 9, 2, 1, 5, 7].
% [7, 9, 5, 4, 6, 1, 8, 3, 2].
% [5, 1, 9, 2, 8, 6, 4, 7, 3].
% [4, 7, 2, 3, 1, 9, 5, 6, 8].
% [8, 6, 3, 7, 4, 5, 2, 1, 9].
