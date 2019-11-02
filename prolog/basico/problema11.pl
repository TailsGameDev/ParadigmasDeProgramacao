fib(N,K) :- N=:=1, K is 1.
fib(N,K) :- N=:=2, K is 1.
fib(N,K) :- fib(N-1,F1), fib(N-2,F2), K is F1+F2.

/*
?- fib(6,R).
R = 8 .

?- fib(7,R).
R = 13 .
*/
