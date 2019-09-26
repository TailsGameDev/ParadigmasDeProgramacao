{-
A conjetura de Goldbach diz que todo numero inteiro par maior que 2 pode
 ser expressado como a soma de dois numeros primos. Embora ela nunca foi
 provada ser verdadeira, ela funciona para numeros grandes.Por  exemplo,
   podemos  escrever  o  n ́umero  14  como  a  soma  de  7  e  7,  ou  18
     como  a  soma  de  5  e  13.Implemente uma fun ̧c ̃ao que receba um n ́umero
      n como parˆametro e retorne um dos n ́umeros primos quefazem parte da soma.
        Ex:  retorne 5 ou 13 para o caso do n ́umero 18.  Leia n do teclado
-}

veprimo:: Int->Int-> String
veprimo _ 1 = "primo"
veprimo n i =
  if ( (mod n i)==0 ) then
    "nao primo"
  else
    veprimo n (i-1)

achaPrimo :: Int -> Int -> Int
achaPrimo _ 0 = 0
achaPrimo 3 1 = 2
achaPrimo n i =
  if ( ((veprimo i (div i 2)) == "primo") && (veprimo (n-i) (div (n-i) 2))=="primo" ) then
    i
  else
    achaPrimo n (i-1)

main = do
  print("digite um valor")
  vString <- getLine
  let v = (read vString :: Int)
  print("um primo que somado com outro primo da o valor eh:")
  print( (achaPrimo v (v-2)) )
