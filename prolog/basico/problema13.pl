omaior(A,B,M) :- (A>B, M is A) ; (A =< B, (M is B)).

maior(A,B,C,X) :- omaior(B,C,Q) , omaior(A, Q, X).

/*
?- maior(5,3,9,X).
X = 9.

?- maior(5,12,9,X).
X = 12
*/
