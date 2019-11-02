media(A,B,C,M) :- M is (A+B+C)/3.

aprovado(A,B,C) :- media(A,B,C,M), M>=6.

/*
?- aprovado(6,6,6).
true.

?- aprovado(6,6,5.9).
false.
*/
