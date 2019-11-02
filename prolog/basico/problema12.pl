distancia3D(ponto(X1,Y1,Z1), ponto(X2,Y2,Z2), Dist) :-
  Dist is sqrt((X2-X1)^2 + (Y2-Y1)^2 + (Z2-Z1)^2).

/*
?- distancia3D(ponto(0,0,0), ponto(1,1,1), D).
D = 1.7320508075688772.
*/
