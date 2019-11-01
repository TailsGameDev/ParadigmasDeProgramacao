eqSegundoGrau(A,B,C,ValorX) :- ValorX is (sqrt(B^2-4*A*C) -B)/(2*A).

/*
?- eqSegundoGrau(1,9,1,X).
X = -0.1125178063039387.
*/
