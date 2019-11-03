omenor(A,B,M) :- (A<B, M is A) ; (A >= B, (M is B)).

menor([],0). % se poe essa linha dah resposta zero tb ><
menor([H],H).
menor([H|C],X) :- menor(C,M), omenor(H,M,X), length(C,LC), LC>0.

/*
?- menor([1,2],X).
X = 1 .

?- menor([0],X).
X = 0 .

?- menor([9,5,6,3],X).
X = 3 .
*/
