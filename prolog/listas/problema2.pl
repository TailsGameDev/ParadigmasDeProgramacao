inserirElementoPosicao(X,0,L1,[X|L1]).

inserirElementoPosicao(X,P,[H|C],[H|L2]) :-
P2 is P-1,
inserirElementoPosicao(X,P2,C,L2).

/*
?- inserirElementoPosicao(22,1,[0,1,2,3,4,5],L).
L = [0, 22, 1, 2, 3, 4, 5] .

?- inserirElementoPosicao(22,4,[0,1,2,3,4,5],L).
L = [0, 1, 2, 3, 22, 4, 5] .
*/
