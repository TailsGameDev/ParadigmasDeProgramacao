module Main (main) where
  import Formas
  import Ponto
  import Arvore
  import Fila
  import Sinais -- questao 5

  main = do
    print (area (Retangulo 5 2))
    print (area (Circulo 5))
    print ("Area do trapezio: "++show(area (Trapezio 5 5 5)) )
    print ( "distancia entre os pontos: "++show(distancia (Ponto2D 0 0) (Ponto2D 1 1)))
    print ( "colineares: "++show(colineares (Ponto2D 0 0) (Ponto2D 1 1) (Ponto2D 2 2) ))
    print ( "formaTriangulo: "++show(formaTriangulo (Ponto2D 0 0) (Ponto2D 1 1) (Ponto2D 2 2) ))
    print ("Saca soh que da hora: parte da P1 virou um modulo!!")
    print ("Questao 3 A) Maior profundidade do elemento escolhido")
    print ( (maiorProfundidadeElemento minhaArvore 33) ) -- questo A
    print ("Questao 3 B) lista de folhas:")
    print ( (listaFolhas minhaArvore []) )
    print ("Questao 3 B) lista de folhas primas:")
    print ( (folhasPrimos minhaArvore) )
    print ( (semRepetidos [2,3,4,5,4,3]) )
    print ( "Eh nois na Fila. Criei uma fila, enfileirei o 3 e entao desenfileirei:" )
    print ( first (enqueue (emptyQueue) 3) )
    print ( "Sinais: " ++show(3***4+++5///6) )
