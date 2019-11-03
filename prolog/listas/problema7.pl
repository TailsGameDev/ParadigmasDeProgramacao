igual(L,L).

palindrome(L) :- reverse(L, L2), igual(L,L2).

/*
?- palindrome([1,2,1]).
true.

?- palindrome([1,2,1,2]).
false.

?- palindrome([1,2,1,2,1]).
true.
*/
