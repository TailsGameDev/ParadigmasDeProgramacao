palavra(0,zero).
palavra(1,um).
palavra(2,dois).
palavra(3,tres).
palavra(4,quatro).
palavra(5,cinco).
palavra(6,seis).
palavra(7,sete).
palavra(8,oito).
palavra(9,nove).
palavra(_,outro).

numerosParaPalavras([],[]).
numerosParaPalavras([Num|C],[P|L2]) :- palavra(Num,P), numerosParaPalavras(C,L2).

/*
?- numerosParaPalavras([1,2],L).
L = [um, dois] .
*/
