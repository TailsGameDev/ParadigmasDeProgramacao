ocorrencias([],_,0).
ocorrencias([H|T],X,N) :- H=:=X, ocorrencias(T,X,N2), N is N2+1.
ocorrencias([H|T],X,N) :- H=\=X, ocorrencias(T,X,N).

/*
?- ocorrencias([1,1,1], 1, N).
N = 3 ;
false.

?- ocorrencias([1,1,2,3,1], 1, N).
N = 3 .
*/
