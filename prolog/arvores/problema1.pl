ponto(1.3,22.1). %exemplo de ponto

distancia(ponto(X1,Y1),ponto(X2,Y2),D) :-
  D is sqrt( (X2-X1)^2 + (Y2-Y1)^2 ).

/*
colineares(ponto(X1,Y1), ponto(X2,Y2), ponto(X3,Y3), C) :-
  C is ( (X1*Y3+X2*Y1+X3*Y2)-(X1*Y2+X3*Y1+X2*Y3) == 0 ).
*/

colineares(ponto(X1,Y1), ponto(X2,Y2), ponto(X3,Y3)) :-
  ( (X1*Y3+X2*Y1+X3*Y2)-(X1*Y2+X3*Y1+X2*Y3) =:= 0 ).

/*
1))))
A)
?- distancia(ponto(1,1),ponto(0,0),D).
D = 1.4142135623730951.

B)
colineares(ponto(1,1),ponto(2,2),ponto(3,3),C).
*/
