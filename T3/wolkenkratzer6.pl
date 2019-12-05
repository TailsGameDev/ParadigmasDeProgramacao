:- use_module(library(clpfd)).

wolkenkratzer(Rows) :-
        length(Rows, 6), maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..6,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        Rows = [[A11, A12, A13, A14, A15, A16],
                [A21, A22, A23, A24, A25, A26],
                [A31, A32, A33, A34, A35, A36],
                [A41, A42, A43, A44, A45, A46],
                [A51, A52, A53, A54, A55, A56],
                [A61, A62, A63, A64, A65, A66]],

        % Linhas da esquerda para a direita
        vejoCerto([A11, A12, A13, A14, A15, A16], 2),
        vejoCerto([A21, A22, A23, A24, A25, A26], 3),
        vejoCerto([A31, A32, A33, A34, A35, A36], 3),
        vejoCerto([A41, A42, A43, A44, A45, A46], 4),
        vejoCerto([A51, A52, A53, A54, A55, A56], 2),
        vejoCerto([A61, A62, A63, A64, A65, A66], 1),


        % Colunas de cima para baixo

        vejoCerto([A11, A21, A31, A41, A51, A61], 4),
        vejoCerto([A12, A22, A32, A42, A52, A62], 1),
        vejoCerto([A13, A23, A33, A43, A53, A63], 2),
        vejoCerto([A14, A24, A34, A44, A54, A64], 2),
        vejoCerto([A15, A25, A35, A45, A55, A65], 3),
        vejoCerto([A16, A26, A36, A46, A56, A66], 2),

        % Linhas da direita para a esquerda

        vejoCerto([A16, A15, A14, A13, A12, A11], 2),
        vejoCerto([A26, A25, A24, A23, A22, A21], 4),
        vejoCerto([A36, A35, A34, A33, A32, A31], 2),
        vejoCerto([A46, A45, A44, A43, A42, A41], 3),
        vejoCerto([A56, A55, A54, A53, A52, A51], 1),
        vejoCerto([A66, A65, A64, A63, A63, A61], 4),

        % Colunas de baixo para cima

        vejoCerto([A61, A51, A41, A31, A21, A11], 1),
        vejoCerto([A62, A52, A42, A32, A22, A12], 3),
        vejoCerto([A63, A53, A43, A33, A23, A13], 5),
        vejoCerto([A64, A54, A44, A34, A24, A14], 2),
        vejoCerto([A65, A55, A45, A35, A25, A15], 4),
        vejoCerto([A66, A56, A46, A36, A26, A16], 2).

        % Diagonais

        % all_distinct([A11, A22, A33, A44, A55, A66]),
        % all_distinct([A16, A25, A34, A43, A52, A61]).

vejoCerto([A, B, C, D, E, F], X) :- L1 is 1 + 6 - X, A in 1..L1,
                                    L2 is 2 + 6 - X, B in 1..L2,
                                    L3 is 3 + 6 - X, C in 1..L3,
                                    L4 is 4 + 6 - X, D in 1..L4,
                                    L5 is 5 + 6 - X, E in 1..L5,
                                    L6 is 6 + 6 - X, F in 1..L6,
                                    quantosVejo([A, B, C, D, E, F], X).

quantosVejo(Lista, Z) :- quantosVejoRecursivo(Lista, 0, Z).

quantosVejoRecursivo([], _, 0).
quantosVejoRecursivo([H|T], Max, V) :- H #> Max, quantosVejoRecursivo(T, H, V1), V is V1 + 1.
quantosVejoRecursivo([H|T], Max, V1) :- H #< Max, quantosVejoRecursivo(T, Max, V1).

problem(1, [[_,_,_,_,_,_],
            [_,_,_,_,_,_],
            [_,_,_,_,_,_],
            [_,_,_,_,_,_],
            [_,_,_,_,_,_],
            [_,_,_,_,_,_]]).
