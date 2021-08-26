module Jogador 
  ( adicionarJogador,
    pesquisarJogador,
    compararJogadores
  ) where

import Pontuacao

adicionarJogador :: IO()
adicionarJogador = do
  putStrLn "Insira o nome do jogador que você quer cadastrar"
  putStrLn "(Caso deseje voltar ao menu anterior digite '0')"

  nomeJogador <- getLine

  if nomeJogador == "0"
    then return ()
    else do
      putStrLn $ adicionaJogador nomeJogador
      putStrLn "Deseja adicionar outro jogador? [y/n]"
      resposta <- getLine
      gerenciaFluxo resposta

gerenciaFluxo :: String -> IO()
gerenciaFluxo resposta = if resposta == "y" then adicionarJogador else return ()

adicionaJogador :: String -> String
adicionaJogador nomeJogador = "Jogador " ++ nomeJogador ++ " adicionado /TODO criar função de adicionar jogador"

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
  
