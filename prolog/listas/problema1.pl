posicao(X,[X|_],P) :- P is 0.
posicao(X,[H|C],P) :- posicao(X,C,Q), P is Q+1, H =\= X.

/*
?- posicao(2,[0,1,3,2,4],P).
P = 3 ;
false.
*/
