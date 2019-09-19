{-
Al ́em  das  opera ̧c ̃oes  inclu ́ıdas  no  problema  anterior,  inclua
tamb ́em  uma  opera ̧c ̃ao  para  raiz  quadrada,na forma
Sqrt Expr.  Trate a situa ̧c ̃ao de raiz quadrada de n ́umero negativo como
erro (utilize o MonadMaybepara isso).  Fa ̧ca as modifica ̧c ̃oes necess ́arias
nas fun ̧c ̃oes de avalia ̧c ̃ao criadas e crie ao menos trˆesexemplos  de
express ̃oes  para  testar  sua  solu ̧c ̃ao.   As  modifica ̧c ̃oes  devem
ser  feitas  nas  trˆes  formas  decriar esta fun ̧c ̃ao vistas em sala de
aula (sem usar monads,  usando>>= e usando a nota ̧c ̃aodo.  N ̃aopreocupe-se
com precedˆencia de operadores.  Qual forma foi mais f ́acil de dar
manuten ̧c ̃ao?  E mais dif ́ıcil?
-}
data Expr = Val Float | Div Expr Expr | Mul Expr Expr | Add Expr Expr | Sub Expr Expr | Sqrt Expr

mysub :: Float -> Float -> Maybe Float
mysub n m = Just (n-m)

myadd :: Float -> Float -> Maybe Float
myadd n m = Just (n+m)

mymul :: Float -> Float -> Maybe Float
mymul n m = Just (n*m)

mydiv :: Float -> Float -> Maybe Float
mydiv n m | m == 0 = Nothing
          | otherwise = Just (n / m)

mysqrt :: Float -> Maybe Float
mysqrt n  | n < 0 = Nothing
          | otherwise = Just (n**0.5)

eval :: Expr -> Maybe Float
eval (Val n) = Just n
eval (Div x y) = case (eval x) of
  Nothing -> Nothing
  Just n -> case (eval y) of
    Nothing -> Nothing
    Just m -> (mydiv n m)
eval (Mul x y) = case (eval x) of
  Nothing -> Nothing
  Just n -> case (eval y) of
    Nothing -> Nothing
    Just m -> (mymul n m)
eval (Add x y) = case (eval x) of
  Nothing -> Nothing
  Just n -> case (eval y) of
    Nothing -> Nothing
    Just m -> (myadd n m)
eval (Sub x y) = case (eval x) of
  Nothing -> Nothing
  Just n -> case (eval y) of
    Nothing -> Nothing
    Just m -> (mysub n m)
eval (Sqrt x) = case (eval x) of
  Nothing -> Nothing
  Just x -> (mysqrt x)

evalmonad :: Expr -> Maybe Float
evalmonad (Val n) = return n
evalmonad (Div x y) = evalmonad x >>=
  (\n -> evalmonad y >>=
    \m -> (mydiv n m))
evalmonad (Mul x y) = evalmonad x >>=
  (\n -> evalmonad y >>=
    \m -> (mymul n m))
evalmonad (Add x y) = evalmonad x >>=
  (\n -> evalmonad y >>=
    \m -> (myadd n m))
evalmonad (Sub x y) = evalmonad x >>=
  (\n -> evalmonad y >>=
    \m -> (mysub n m))
evalmonad (Sqrt x) = evalmonad x >>=
  (\m -> (mysqrt m))

evalfinal :: Expr -> Maybe Float
evalfinal (Val n) = return n
evalfinal (Div x y) = do
  n <- evalfinal x
  m <- evalfinal y
  mydiv n m
evalfinal (Mul x y) = do
  n <- evalfinal x
  m <- evalfinal y
  mymul n m
evalfinal (Add x y) = do
  n <- evalfinal x
  m <- evalfinal y
  myadd n m
evalfinal (Sub x y) = do
  n <- evalfinal x
  m <- evalfinal y
  mysub n m
evalfinal (Sqrt x) = do
  n <- evalfinal x
  mysqrt n
--eval (Mul x y) = mymul x y--Just ((eval x) * (eval y) )

main = do
  print("Sqrt 8")
  print ( eval (Sqrt (Val 8) ))
  print ( evalmonad (Sqrt (Val 8) ))
  print ( evalfinal (Sqrt (Val 8) ))
  print("Sqrt -8")
  print ( eval (Sqrt (Val (-8) ) ))
  print ( evalmonad (Sqrt (Val (-8) ) ))
  print ( evalfinal (Sqrt (Val (-8) ) ))
  print("(Sqrt 8) + 2")
  print ( eval (Add (Sqrt (Val (8) )) (Val 2) ))
  print ( evalmonad (Add (Sqrt (Val (8) )) (Val 2) ))
  print ( evalfinal (Add (Sqrt (Val (8) )) (Val 2) ))
  print ("o jeito mais facil eh o evalfinal, e o mais dificil eh o eval puro")
