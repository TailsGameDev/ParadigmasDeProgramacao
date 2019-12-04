:- use_module(library(clpfd)).

sudoku(Rows) :-
        length(Rows, 4), maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..4,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        Rows = [[A11, A12, A13, A14],
                [A21, A22, A23, A24],
                [A31, A32, A33, A34],
                [A41, A42, A43, A44]],
        % maplist(limite, As),
        % maplist(limite, Bs),

        % Linhas da esquerda para a direita
        vejoCerto([A11, A12, A13, A14], 2),
        % vejoCerto([A21, A22, A23, A24], 0),
        vejoCerto([A31, A32, A33, A34], 3),
        % vejoCerto([A41, A42, A43, A44], 0),

        % Colunas de cima para baixo

        % vejoCerto([A11, A21, A31, A41], 0),
        % vejoCerto([A12, A22, A32, A42], 0),
        % vejoCerto([A13, A23, A33, A43], 0),
        % vejoCerto([A14, A24, A34, A44], 0),

        % Linhas da direita para a esquerda

        % vejoCerto([A14, A13, A12, A11], 0),
        % vejoCerto([A24, A23, A22, A21], 0),
        % vejoCerto([A34, A33, A32, A31], 0),
        % vejoCerto([A44, A43, A42, A41], 0),

        % Colunas de baixo para cima

        % vejoCerto([A41, A31, A21, A11], 0),
        vejoCerto([A42, A32, A22, A12], 3),
        vejoCerto([A43, A33, A23, A13], 4).
        % vejoCerto([A44, A34, A24, A14], 0).

quantosVejo([], 0).
quantosVejo(Lista, V) :- quantosVejoRecursivo(Lista, -1, V).

quantosVejoRecursivo([], _, 0).
quantosVejoRecursivo([H|T], Max, V) :- H #> Max, quantosVejoRecursivo(T, H, V1), V is V1 + 1, !.
quantosVejoRecursivo([_|T], Max, V1) :- quantosVejoRecursivo(T, Max, V1).

limite(A) :- A in 1..2.

inverte([], []).
inverte([H|T], I) :- inverte(T, I1), append(I1, [H], I).

vejoCerto(Lista, V) :- quantosVejo(Lista, V).

soma([], 0).
soma([H|T], S) :- soma(T, S1), S is S1 + H.

problem(1, [[_,_,_,_],
            [_,_,_,_],
            [_,_,_,_],
            [_,_,_,_]]).

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
