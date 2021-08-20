module Pontuacao
  ( calcularPontuacao,
    compararPontuacao
  ) where

calcularPontuacao :: Bool -> Int -> String
calcularPontuacao jogadorVenceu pontuacaoJogador = 
  if (jogadorVenceu == True) 
    then retornaPontuacao (pontuacaoJogador +1)
    else retornaPontuacao (pontuacaoJogador -1)

compararPontuacao :: Int -> Int -> Bool
compararPontuacao pontuacaoJogUm pontuacaoJogDois =
  if (pontuacaoJogUm > pontuacaoJogDois)
    then True
    else False

retornaPontuacao :: Int -> String
retornaPontuacao pontuacao = "Pontuacao do jogador atual é " ++ show pontuacao
