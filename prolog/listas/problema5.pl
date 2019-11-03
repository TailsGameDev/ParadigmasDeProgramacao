soma([],0).
soma([H|C],S) :- soma(C,X), S is X+H.

media(L,X) :- soma(L,Soma), length(L,Comprimento), X is Soma/Comprimento.

/*
?- media([1,2,3,4,5],M).
M = 3.
*/
