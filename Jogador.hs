module Jogador 
  ( adicionarJogador,
    pesquisarJogador,
    compararJogadores
  ) where

import Pontuacao

adicionarJogador :: String
adicionarJogador = "Adicionando um jogador"

pesquisarJogador :: String
pesquisarJogador = "Procurando um jogador"

compararJogadores :: IO()
compararJogadores = comparaJogadoresMenu

comparaPontos :: Int -> Int -> String
comparaPontos pontJogUm pontJogDois = 
  if ((Pontuacao.compararPontuacao pontJogUm pontJogDois) == True)
  then "Jogador 1 é melhor"
  else "Jogador 2 é melhor"

comparaJogadoresMenu :: IO()
comparaJogadoresMenu = do
  putStrLn "Informe as pontuações do jogadores"
  putStrLn "Jogador 1:"
  pontJogUm <- getLine
  putStrLn "Jogador 2:"
  pontJogDois <- getLine

  print (comparaPontos (read pontJogUm) (read pontJogDois))
  
