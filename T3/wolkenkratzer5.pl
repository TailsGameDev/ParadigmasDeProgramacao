:- use_module(library(clpfd)).

wolkenkratzer(Rows) :-
        length(Rows, 5), maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..5,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        Rows = [[A11, A12, A13, A14, A15],
                [A21, A22, A23, A24, A25],
                [A31, A32, A33, A34, A35],
                [A41, A42, A43, A44, A45],
                [A51, A52, A53, A54, A55]],

        % Linhas da esquerda para a direita
        vejoCerto([A11, A12, A13, A14, A15], 0),
        vejoCerto([A21, A22, A23, A24, A25], 0),
        vejoCerto([A31, A32, A33, A34, A35], 0),
        vejoCerto([A41, A42, A43, A44, A45], 0),
        vejoCerto([A51, A52, A53, A54, A55], 0),

        % Colunas de cima para baixo

        vejoCerto([A11, A21, A31, A41, A51], 0),
        vejoCerto([A12, A22, A32, A42, A52], 0),
        vejoCerto([A13, A23, A33, A43, A53], 0),
        vejoCerto([A14, A24, A34, A44, A54], 0),
        vejoCerto([A15, A25, A35, A45, A55], 0),

        % Linhas da direita para a esquerda

        vejoCerto([A15, A14, A13, A12, A11], 0),
        vejoCerto([A25, A24, A23, A22, A21], 0),
        vejoCerto([A35, A34, A33, A32, A31], 0),
        vejoCerto([A45, A44, A43, A42, A41], 0),
        vejoCerto([A55, A54, A53, A52, A51], 0),

        % Colunas de baixo para cima

        vejoCerto([A51, A41, A31, A21, A11], 0),
        vejoCerto([A52, A42, A32, A22, A12], 0),
        vejoCerto([A53, A43, A33, A23, A13], 0),
        vejoCerto([A54, A44, A34, A24, A14], 0),
        vejoCerto([A55, A45, A35, A25, A15], 0),

        % Diagonais
        vejoCerto([A11, A22, A33, A44, A55], 0),
        vejoCerto([A15, A24, A33, A42, A51], 0).

vejoCerto([A, B, C, D, E], X) :- L1 is 1 + 5 - X, A in 1..L1,
                                 L2 is 2 + 5 - X, B in 1..L2,
                                 L3 is 3 + 5 - X, C in 1..L3,
                                 L4 is 4 + 5 - X, D in 1..L4,
                                 L5 is 5 + 5 - X, E in 1..L5,
                                 quantosVejo([A, B, C, D, E], X).

quantosVejo(Lista, Z) :- quantosVejoRecursivo(Lista, 0, Z).

quantosVejoRecursivo([], _, 0).
quantosVejoRecursivo([H|T], Max, V) :- H #> Max, quantosVejoRecursivo(T, H, V1), V is V1 + 1.
quantosVejoRecursivo([H|T], Max, V1) :- H #< Max, quantosVejoRecursivo(T, Max, V1).

problem(1, [[_,_,_,_,_],
            [_,_,_,_,_],
            [_,_,_,_,_],
            [_,_,_,_,_],
            [_,_,_,_,_]]).
