estuda(caina, ine5416).
estuda(vinicius, ine5416).

leciona(maicao, ine5416).

ensina(P,A) :- leciona(P, D), estuda(A, D).
colegas(A1,A2) :- estuda(A1, D), estuda(A2,D), A1 \== A2.

/*
?- ensina(P,A).
P = maicao,
A = caina.

?- colegas(A1,A2).
A1 = caina,
A2 = vinicius ;
A1 = vinicius,
A2 = caina ;
false.

?- ensina(maicao,D).
D = caina .

?- leciona(maicao,D).
D = ine5416.

?- colegas(caina,A2).
A2 = vinicius.

*/
