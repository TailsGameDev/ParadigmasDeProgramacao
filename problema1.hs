{-
1. Crie uma função que receba dois números x e y e retorne x y .
Leia x e y do teclado.
-}

potenciacao :: Float -> Float -> Float
potenciacao x y = x**y


main = do
    xString <- getLine
    --Converte notaString para Float
    let x = (read xString :: Float)
    yString <- getLine
    let y = (read yString :: Float)

    let poten = potenciacao x y

    print(poten)
