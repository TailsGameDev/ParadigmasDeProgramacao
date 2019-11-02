operacao(Op,X,Y,Resultado) :-
((Op == '+'), Resultado is X+Y);
((Op == '-'), Resultado is X-Y);
((Op == '*'), Resultado is X*Y);
((Op == '/'), Resultado is X/Y).

/*
?- operacao(/,5,2,R).
R = 2.5.

?- operacao(*,5,2,R).
R = 10 ;
*/
