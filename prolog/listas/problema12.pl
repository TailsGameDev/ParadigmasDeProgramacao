apagar(0,L,L).
apagar(N,[H|T],L2) :- N>0, N2 is N-1, apagar(N2,T,L2).

/*
?- apagar(2,[1,2,3,4], R).
R = [3, 4]
*/
