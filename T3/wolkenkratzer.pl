:- use_module(library(clpfd)).

wolkenkratzer(Rows) :-
        % verifica se as linhas tem o mesmo tamanho
        length(Rows, 4), maplist(same_length(Rows), Rows),
        % garante que todos os numeros no tabuleiro resposta estejam no range desejado
        append(Rows, Vs), Vs ins 1..4,
        % restringe para que todas os elementos de cada linha sejam distintos
        maplist(all_distinct, Rows),
        % restringe que todos os elementos das colunas sejam distintos
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        %atribui um nome para cada posicao da matriz
        Rows = [[A11, A12, A13, A14],
                [A21, A22, A23, A24],
                [A31, A32, A33, A34],
                [A41, A42, A43, A44]],
        % maplist(limite, As),
        % maplist(limite, Bs),

        % Linhas da esquerda para a direita

        vejoCerto([A11, A12, A13, A14], 0),
        vejoCerto([A21, A22, A23, A24], 0),
        vejoCerto([A31, A32, A33, A34], 0),
        vejoCerto([A41, A42, A43, A44], 0),

        % Colunas de cima para baixo

        vejoCerto([A11, A21, A31, A41], 0),
        vejoCerto([A12, A22, A32, A42], 0),
        vejoCerto([A13, A23, A33, A43], 0),
        vejoCerto([A14, A24, A34, A44], 0),

        % Linhas da direita para a esquerda

        vejoCerto([A14, A13, A12, A11], 0),
        vejoCerto([A24, A23, A22, A21], 0),
        vejoCerto([A34, A33, A32, A31], 0),
        vejoCerto([A44, A43, A42, A41], 0),

        % Colunas de baixo para cima

        vejoCerto([A41, A31, A21, A11], 0),
        vejoCerto([A42, A32, A22, A12], 0),
        vejoCerto([A43, A33, A23, A13], 0),
        vejoCerto([A44, A34, A24, A14], 0),

        % Diagonais

        all_distinct([A11, A22, A33, A44]),
        all_distinct([A14, A23, A32, A41]).

% Preenche a lista dada com uma combinação valida de numeros tal que
% o numero de predios vistos seja igual a X.
                              % Limita a atura maxima em cada posicao baseando-se
                              % em quantos predios devem ser vistos na lista.
vejoCerto([A, B, C, D], X) :- L1 is 1 + 4 - X, A in 1..L1,
                              L2 is 2 + 4 - X, B in 1..L2,
                              L3 is 3 + 4 - X, C in 1..L3,
                              L4 is 4 + 4 - X, D in 1..L4.
                              % Preenche a linha com uma combinacao valida.
                              quantosVejo([A, B, C, D], X).
                              %alturas máximas possíveis:
                              % 1 2 3 4 caso esteja vendo 4 predios
                              % 2 3 4 4 caso 3
                              % 3 4 4 4 caso 2
                              % 4 4 4 4 caso 1

% o quantos vejo é uma regra recursiva que busca contar, da esquerda para a direita
% quantos prédios estao sendo vistos.
quantosVejo(Lista, Z) :- quantosVejoRecursivo(Lista, 0, Z).

quantosVejoRecursivo([], _, 0).
quantosVejoRecursivo([H|T], Max, V) :- H #> Max, quantosVejoRecursivo(T, H, V1), V is V1 + 1.
quantosVejoRecursivo([H|T], Max, V1) :- H #< Max, quantosVejoRecursivo(T, Max, V1).

% define a matriz em branco, ou com posições pré-preenchidas
problem(1, [[_,_,_,_],
            [_,_,_,_],
            [_,_,_,_],
            [_,_,_,_]]).
