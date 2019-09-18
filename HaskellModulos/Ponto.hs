module Ponto where

data Ponto = Ponto2D Float Float

distancia::Ponto->Ponto->Float
distancia (Ponto2D x y) (Ponto2D x2 y2) = ((x2-x)**2+(y2-y)**2)**0.5

colineares ::  Ponto -> Ponto -> Ponto -> Bool
colineares (Ponto2D x1 y1) (Ponto2D x2 y2) (Ponto2D x3 y3) =
  (y2*x3 + x1*y3 + y1*x2 -x1*y2 - y1*x3 - x2*y3) == 0

formaTriangulo ::  Ponto -> Ponto -> Ponto -> Bool
formaTriangulo a b c = not (colineares a b c)
