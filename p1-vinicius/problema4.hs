import Data.List

data Forma = Retangulo Ponto Ponto
    deriving(Show)
data Ponto = Ponto2D Int Int
    deriving(Show, Eq)

dentro :: Forma -> [Ponto] -> [[Ponto]]
dentro _ [] = []
dentro (Retangulo esq dir) (a:b) = (pontosDentro(Retangulo esq dir) (a:b)):((a:b)\\pontosDentro(Retangulo esq dir) (a:b)):[]

pontosDentro :: Forma -> [Ponto] -> [Ponto]
pontosDentro (Retangulo esq dir) (a:b) = [x|x <- (a:b), pontoEstaDentro (Retangulo esq dir) x]

pontoEstaDentro :: Forma -> Ponto -> Bool
pontoEstaDentro (Retangulo esq dir) p =
    (getX p >= getX esq && getX p <= getX dir) && (getY p <= getY dir && getY p >= getY esq)

getX :: Ponto -> Int
getX (Ponto2D x _) = x

getY :: Ponto -> Int
getY (Ponto2D _ y) = y

meuPonto :: Int -> Ponto
meuPonto 1 = (Ponto2D 0 0)
meuPonto 2 = (Ponto2D 1 0)
meuPonto 3 = (Ponto2D 0 0)
meuPonto 4 = (Ponto2D 3 4)
meuPonto 5 = (Ponto2D 2 0)
meuPonto 6 = (Ponto2D (-1) (-1))

main = do
    print (dentro (Retangulo (Ponto2D 0 0) (Ponto2D 1 1)) [meuPonto 1,meuPonto 2,meuPonto 3,meuPonto 4, meuPonto 5, meuPonto 6])