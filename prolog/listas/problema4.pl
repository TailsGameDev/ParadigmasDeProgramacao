soma([],0).

soma([H|C],S) :- soma(C,X), S is X+H.

/*
?- soma([1,2],S).
S = 3.
*/
