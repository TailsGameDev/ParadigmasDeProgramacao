dado(N,N).
dado(N,P):- N2 is (N-1), N>1, dado(N2,P).
/*dado(N,P) :- P is N; (N2 is (N-1), dado(N2,P)).
*/

listaDados(1,[Dado]):- dado(6,Dado).
listaDados(D,LD) :- dado(6,Dado), D2 is D-1, D2>0, listaDados(D2,LDR), append(LDR,[Dado],LD).

soma([],0).
soma([H|C],S) :- soma(C,X), S is X+H.

dados(D,S,LD) :- listaDados(D,LD), soma(LD, Soma), S=:=Soma .

/*
?- dados(1,6,L).
L = [6] ;
false.

?- dados(4,3,L).
false.

?- dados(4,8,L).
L = [1, 1, 1, 5] ;
L = [1, 1, 2, 4] ;
L = [1, 2, 1, 4] ;
L = [2, 1, 1, 4] ;
L = [1, 1, 3, 3] ;
L = [1, 2, 2, 3] ;
L = [2, 1, 2, 3] ;
L = [1, 3, 1, 3] ;
L = [2, 2, 1, 3] ;
L = [3, 1, 1, 3] ;
L = [1, 1, 4, 2] ;
L = [1, 2, 3, 2] ;
L = [2, 1, 3, 2] ;
L = [1, 3, 2, 2] ;
L = [2, 2, 2, 2] ;
L = [3, 1, 2, 2] ;
L = [1, 4, 1, 2] ;
L = [2, 3, 1, 2] ;
L = [3, 2, 1, 2] ;
L = [4, 1, 1, 2] ;
L = [1, 1, 5, 1] ;
L = [1, 2, 4, 1] ;
L = [2, 1, 4, 1] ;
L = [1, 3, 3, 1] ;
L = [2, 2, 3, 1] ;
L = [3, 1, 3, 1] ;
L = [1, 4, 2, 1] ;
L = [2, 3, 2, 1] ;
L = [3, 2, 2, 1] ;
L = [4, 1, 2, 1] ;
L = [1, 5, 1, 1] ;
L = [2, 4, 1, 1] ;
L = [3, 3, 1, 1] ;
L = [4, 2, 1, 1] ;
L = [5, 1, 1, 1] ;
false.
*/
