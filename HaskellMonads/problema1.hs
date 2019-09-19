{-
Altere o exemplo visto em sala sobre a opera ̧c ̃ao Div para suportar
tamb ́em as opera ̧c ̃oesMul Expr Expr(para multiplica ̧c ̃ao),
Add Expr Expr(para soma) eSub Expr Expr(para subtra ̧c ̃ao).
Assim, sua solu ̧c ̃aodeve suportar express ̃oes como
(Mul (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)).
Fa ̧caas modifica ̧c ̃oes necess ́arias nas fun ̧c ̃oes de avalia ̧c ̃ao
criadas e crie ao menos trˆes exemplos de express ̃oespara testar sua
solu ̧c ̃ao.  As modifica ̧c ̃oes devem ser feitas nas trˆes formas de criar
esta fun ̧c ̃ao vistas emsala de aula (sem usar monads, usando>>= e usando a
nota ̧c ̃aodo.  N ̃ao preocupe-se com precedˆenciade operadores.  Qual
forma foi mais f ́acil de dar manuten ̧c ̃ao?  E mais dif ́ıcil?


data Maybe a = Nothing | Just a
  deriving (Eq, Ord, Read, Show)

instance Monad Maybe where
  Nothing  >>= f = Nothing
  (Just x) >>= f = f x
  return         = Just
-}


data Expr = Val Float | Div Expr Expr | Mul Expr Expr | Add Expr Expr | Sub Expr Expr

mysub :: Float -> Float -> Maybe Float
mysub n m = Just (n-m)

myadd :: Float -> Float -> Maybe Float
myadd n m = Just (n+m)

mymul :: Float -> Float -> Maybe Float
mymul n m = Just (n*m)

mydiv :: Float -> Float -> Maybe Float
mydiv n m | m == 0 = Nothing
          | otherwise = Just (n / m)

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
--eval (Mul x y) = mymul x y--Just ((eval x) * (eval y) )

main = do
  print("->Div 28 2")
  print( eval (Div (Val 28) (Val 2)) )
  print( evalmonad (Div (Val 28) (Val 2)) )
  print( evalfinal (Div (Val 28) (Val 2)) )
  print("->Mul 28 2")
  print( eval (Mul (Val 28) (Val 2)) )
  print( evalmonad (Mul (Val 28) (Val 2)) )
  print( evalfinal (Mul (Val 28) (Val 2)) )
  print("->Add 28 2")
  print( eval (Add (Val 28) (Val 2)) )
  print( evalmonad (Add (Val 28) (Val 2)) )
  print( evalfinal (Add (Val 28) (Val 2)) )
  print("->Sub 28 2")
  print( eval (Sub (Val 28) (Val 2)) )
  print( evalmonad (Sub (Val 28) (Val 2)) )
  print( evalfinal (Sub (Val 28) (Val 2)) )
  print("->teste geral 1:")
  print( eval ( (Mul (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)) ) )
  print( evalmonad ( (Mul (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)) ) )
  print( evalfinal ( (Mul (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)) ) )
  print("->teste geral 2:")
  print( eval ( (Div (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)) ) )
  print( evalmonad ( (Div (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)) ) )
  print( evalfinal ( (Div (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)) ) )
  print("->teste geral 3:")
  print( eval ( (Add (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)) ) )
  print( evalmonad ( (Add (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)) ) )
  print( evalfinal ( (Add (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)) ) )

  print ("o jeito mais facil eh o evalfinal, e o mais dificil eh o eval puro")
