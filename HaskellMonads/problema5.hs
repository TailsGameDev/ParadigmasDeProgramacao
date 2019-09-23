{-
Pesquise sobre a classe Monad do Haskell. Que outras operac¸˜oes, al´em de
return e >>= existem nela? Qual a diferen¸ca entre >> e >>=?

Existe a operação  >>  e a  fail

do e1 ; e2      =        e1 >> e2
do p <- e1; e2  =        e1 >>= \p -> e2

basicamente o >> eh usado quando o resultado da primeira operação não interessa
para a segunda.
-}
