negativo(A) :- A<0.
naoNegativo(A) :- A>=0.

absoluto(N,X) :- ( (X is -N), negativo(N) ) ; ((X is N), naoNegativo(N)).

/*
?- absoluto(3,X).
X = 3.

?- absoluto(-3,X).
X = 3
*/
