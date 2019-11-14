/*começamos fazendo um append de H em C, mas isso retornava apenas uma rotação
Então, partimos para a ideia de retornar o append ou uma chamada recursiva.
Só que aí ela nunca parava de encontrar rotações, pois as repetia. Depois disso,
Inserimos um contador com o tamanho da lista, para que a busca parasse no momento
certo.*/

rotacoes2(_,0,_) :- !.
rotacoes2([H|C],I,LF) :- I=\=0, I2 is (I-1), append(C,[H],L2), ( append(L2,[],LF) ; rotacoes2(L2,I2,LF) ).

rotacoes(L1,L2) :- length(L1,C),rotacoes2(L1,C,L2).
/*
?- rotacoes([1,2],L2).
L2 = [2, 1] ;
L2 = [1, 2] ;
true.

?- rotacoes([1,2,3],L).
L = [2, 3, 1] ;
L = [3, 1, 2] ;
L = [1, 2, 3] ;
true.
*/
