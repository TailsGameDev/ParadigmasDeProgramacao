xor(X,Y) :- (X, not(Y)) ; (Y, not(X)).%(R is X, X, not(Y)) ; (R is Y, Y, not(X))

/*
?- xor(true,false).
true.

?- xor(true,true).
false.
*/
