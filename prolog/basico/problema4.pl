menorQBC(A,B,C) :- A < B+C.
triangulo(X,Y,Z) :- menorQBC(X,Y,Z), menorQBC(Y,X,Z), menorQBC(Z,X,Y).

/*
?- triangulo(4,8,9).
true.

?- triangulo(10,5,4).
false.
*/
