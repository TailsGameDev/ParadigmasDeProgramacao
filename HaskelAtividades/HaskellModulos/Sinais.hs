module Sinais where


infixr  6 +++
infixr  7 ***,///

(+++) :: Int -> Int -> Int
a +++ b = a + 2*b

(***) :: Int -> Int -> Int
a *** b = a - 4*b

(///) :: Int -> Int -> Int
a /// b = 2*a - 3*b
