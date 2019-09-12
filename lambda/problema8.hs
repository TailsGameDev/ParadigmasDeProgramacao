{-
a) Crie uma fun ̧c ̃ao que receba uma matriz e retorne a soma de seus elementos.
b) Crie uma fun ̧c ̃ao que receba duas matrizes e retorne a soma delas.
c) Dizemos que uma matriz quadrada inteiraAnxn ́e um quadrado m ́agico se
e formada pelos n ́umeros(n ̃ao repetidos) de 1 `an2e a soma dos elementos de
cada linha, a soma dos elementos de cada colunae  a  soma  dos  elementos
das  diagonais  principal  e  secund ́aria  s ̃ao  todas  iguais.
O  exemplo  abaixomostra  um  quadrado  m ́agico  v ́alido.
Fa ̧ca  um  fun ̧c ̃ao  que  retorne  se  uma  matriz  ́e  um  quadradom ́agico ou n ̃ao.

d) Dizemos  que  uma  matriz  inteiraAnxn ́e  uma  matriz  de  permuta ̧c ̃ao
se  em  cada  linha  e  em  cadacoluna houvern−1 elementos nulos e um  ́unico
elemento igual a 1.  O exemplo abaixo mostra umamatriz de permuta ̧c ̃ao.
Fa ̧ca uma fun ̧c ̃ao que retorne se uma matriz  ́e uma matriz de permuta ̧c ̃ao oun ̃ao.

e)
Dizemos  que  uma  matriz  quadrada  inteiraAnxn ́e  um  quadrado  m ́agico  se
a  soma  dos  elementosde uma determinada linha, coluna ou diagonal  ́e sempre
igual.  Fa ̧ca uma fun ̧c ̃ao que receba comoparˆametro uma matriz com alguns
n ́umeros do quadrado m ́agico j ́a preenchidos e retorne uma matrizcom o
quadrado m ́agico completo.  Considere que n ́umeros v ̃ao de 1 at ́e 1000
(inclusive) e podemse repetir.  As posi ̧c ̃oes da matriz com 0 indicam que
aquela posi ̧c ̃ao n ̃ao est ́a preenchida.  Abaixo,s ̃ao ilustrados dois
exemplos de matrizes dadas como entrada e o resultado esperado da sua
fun ̧c ̃ao.Note  que  podem  existir  v ́arios  resultados  v ́alidos,
mas  tamb ́em  pode  ocorrer  de  n ̃ao  existir  umasolu ̧c ̃ao para a
matriz dada.  Neste caso, retorne uma matriz toda zerada.
PS: note que a defini ̧c ̃aode  quadrado  m ́agico  neste  exerc ́ıcio  ́e
diferente  do  exerc ́ıcio  anterior.   DICA:  utilize  o  m ́etodo
datentativa e erro (backtracking)

f)
Crie uma fun ̧c ̃ao que receba um tabuleiro de Sudoku (em forma de uma matriz 9x9)
j ́a preenchido ediga se a solu ̧c ̃ao dele  ́e v ́alida ou n ̃ao.  Para ser
uma solu ̧c ̃ao do problema, cada linha e coluna deveconter todos os n ́umeros
de 1 a 9.  Al ́em disso, se dividirmos a matriz em 9 regi ̃oes 3 x 3, cada
umadestas regi ̃oes tamb ́em deve conter os n ́umeros de 1 a 9.  O exemplo
abaixo mostra uma matriz que ́e uma solu ̧c ̃ao do problema.
-}

------------------ A) abaixo---------------------
soma:: [Int] -> Int
soma [] = 0
soma (a:b) = a + soma b
------------------ A) acima ---------------------

------------------ B) abaixo---------------------
somaMatricial :: [Int] -> [Int] -> [Int]
somaMatricial [] [] = []
somaMatricial (a:b) (c:d) = [a+c] ++ (somaMatricial b d)
------------------ B) acima---------------------

------------------ C) abaixo---------------------

------------------ C) acima---------------------

main = do
  print( (somaMatricial [1,2] [1,2]) )
