:- use_module(library(clpfd)).

sudoku(Rows) :-
        length(Rows, Length), maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..Length,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns).

quantosVejo([], _, 0).
quantosVejo([H|T], Max, V) :- H > Max, quantosVejo(T, H, V1), V is V1 + 1, !.
quantosVejo([_|T], Max, V1) :- quantosVejo(T, Max, V1).

inverte([], []).
inverte([H|T], I) :- inverte(T, I1), append(I1, [H], I).

vejoCerto(Lista, V) :- quantosVejo(Lista, -1, V).

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
