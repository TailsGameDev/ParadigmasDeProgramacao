{-
Altere a classe MeuInt vista em sala de aula e dispon ́ıvel nos slides no Moodle
para suportar novos m ́etodose opera ̧c ̃oes, descritos abaixo:
A:par ::  x -> Bool-
Este m ́etodo deve retornar se um dado n ́umero  ́e par ou n ̃ao.
B:impar ::  x -> Bool- Este m ́etodo deve retornar se um dado n ́umero  ́e  ́ımpar ou n ̃ao.
C:primo ::  x -> Bool- Este m ́etodo deve retornar se um dado n ́umero  ́e primo ou n ̃ao.
D:mdc ::  x -> x -> x- Este m ́etodo deve retornar o m ́aximo divisor comum entre dois
n ́umeros.
E:(===) ::  x -> x -> Bool-  Este  operador  deve  retornar  True  se  a
diferen ̧ca  entre  dois  n ́umerosinteiros  ́e igual ou menor que 1 e False se a
diferen ̧ca entre dois inteiros  ́e maior que 1.
F:Crie um novo m ́etodo a sua escolha, explique seu funcionamento e exemplifique
seu uso.
G:Crie um novo operador a sua escolha, explique seu funcionamento e
exemplifique seu uso.
H:Crie exemplos ilustrativos utilizando cada um dos novos
m ́etodos e operadores desta quest ̃ao.
-}

class (Integral x) => MeuInt x where
  bigger  :: x -> x -> x
  smaller  :: x -> x -> x
  par :: x -> Bool
  impar :: x -> Bool
  veprimo:: x->x-> String
  primo:: x -> Bool
  mdc:: x->x->x
  (===) :: x -> x -> Bool
  vdd :: x->Bool
  (+++++) :: x -> x-> Int

  bigger a b  | a > b = a
              | otherwise = b
  smaller a b | a == (bigger a b) = b
              | otherwise = a
  par a = (mod a 2) == 0
  impar a = not (par a)

  veprimo _ 1 = "primo"
  veprimo n i =
    if ( (mod n i)==0 ) then
      "nao primo"
    else
      veprimo n (i-1)

  primo a = (veprimo a (div a 2) ) == "primo"

  mdc a 0 = a
  mdc a b = mdc b (mod a b)

  x === y = (x+1==y) || (y+1==x)

  vdd a = True -- esse metodo retorna True sempre.

  a +++++ b = 999999999999

instance MeuInt Integer
instance MeuInt Int

main = do
  print (bigger (4::Integer) (12::Integer))
  print (smaller (4::Integer) (12::Integer))
  putStr ( "\n4 eh par: "++show (par (4::Int)) )
  putStr ( "\n5 eh impar: "++show (impar (5::Int)) )
  putStr ( "\n13 eh primo: "++show (primo (13::Int)) )
  putStr ( "\n13 eh quase 12 (===): "++show ((-13::Int) ===(-12::Int)) )
  putStr ( "\n13 eh vdd? : "++show ( vdd (-13::Int) ) )
  putStr ( "\n12 +++++ 13 == : "++show ((-13::Int) +++++ (-12::Int)) )
