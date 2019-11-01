genitor(pam, darius).
genitor(pam, bob).
genitor(tom, bob).
genitor(tom, liz).

genitor(bob, ana).
genitor(bob, pat).

genitor(liz,bill).

genitor(pat, jim).

mulher(pam).
mulher(liz).
mulher(pat).
mulher(ana).
homem(tom).
homem(bob).
homem(jim).
homem(bill).
homem(darius).

pai(X,Y) :- genitor(X,Y), homem(X).
mae(X,Y) :- genitor(X,Y), mulher(X).

avo(AvoX, X) :- genitor(GenitorX, X), genitor(AvoX, GenitorX), homem(AvoX).
avoh(AvohX, X) :- genitor(GenitorX, X), genitor(AvohX, GenitorX), mulher(AvohX).
irmao(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, homem(X).
irma(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, mulher(X).
irmaos(X,Y) :- (irmao(X,Y); irma(X,Y)), X \== Y.

ascendente(X,Y) :- genitor(X,Y). %recursão - caso base
ascendente(X,Y) :- genitor(X, Z), ascendente(Z, Y). %recursão - passo recursivo

/* problema 1 abaixo*/
tio(X,Y) :- genitor(Z,Y), irmao(Z,X), homem(X).
tia(X,Y) :- genitor(Z,Y), irmao(Z,X), mulher(X).
primo(X,Y) :- genitor(G1,X), genitor(G2,Y), irmaos(G1,G2), homem(X).
prima(X,Y) :- genitor(G1,X), genitor(G2,Y), irmaos(G1,G2), mulher(X).
bisavo(X,Y) :- genitor(GY,Y), genitor(GGY,GY), genitor(X,GGY), homem(X).
bisavoh(X,Y) :- genitor(GY,Y), genitor(GGY,GY), genitor(X,GGY), mulher(X).
descendente(X,Y) :- genitor(Y,X).
descendente(X,Y) :- genitor(GX, X), descendente(GX,Y).
feliz(X) :- genitor(X,Y).

/* Consultas
?- tio(X,Y).
X = darius,
Y = ana .

?- tia(X,Y).
X = liz,
Y = ana .

?- primo(X,Y).
X = bill,
Y = ana ;
X = bill,
Y = pat ;
false.

?- prima(X,Y).
X = ana,
Y = bill ;
X = pat,
Y = bill ;

?- bisavo(X,Y).
X = tom,
Y = jim.

?- bisavoh(X,Y).
X = pam,
Y = jim ;
false.

?- descendente(ana,Y).
Y = bob ;
Y = pam ;
Y = tom ;
false.

?- feliz(pam).
true ;
true.

?- feliz(jim).
false.
*/
