primeiros(0,_,[]).
primeiros(N,[H|T],[H|L2]) :- N>0, N2 is N-1, primeiros(N2,T,L2).

/*
?- primeiros(3,[1,2,3,4,5,6,7],R).
R = [1, 2, 3] .
*/
