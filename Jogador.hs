module Jogador 
  ( adicionarJogador,
    pesquisarJogador,
    compararJogadores
  ) where

import Pontuacao

-- FUNÇÕES RELACIONADAS COM A ADIÇÃO DE JOGADORES
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
      gerenciaFluxoAdicao resposta

gerenciaFluxoAdicao :: String -> IO()
gerenciaFluxoAdicao resposta = if resposta == "y" then adicionarJogador else return ()

adicionaJogador :: String -> String
adicionaJogador nomeJogador = "Jogador " ++ nomeJogador ++ " adicionado /TODO criar função de adicionar jogador"


-- FUNÇÕES RELACIONADAS COM A PESQUISA POR JOGADORES
pesquisarJogador :: IO()
pesquisarJogador = do
  putStrLn "Digite o nome do jogador que você quer buscar"
  nomeJogador <- getLine
  putStrLn $ buscarJogadorPorNome nomeJogador
  putStrLn "Deseja buscar por outro jogador? [y/n]"
  respostaPesquisa <- getLine
  gerenciaFluxoPesquisa respostaPesquisa

gerenciaFluxoPesquisa :: String -> IO()
gerenciaFluxoPesquisa resposta = if resposta == "y" then pesquisarJogador else return ()

buscarJogadorPorNome :: String -> String
buscarJogadorPorNome nome = "Buscando jogador " ++ nome ++ " /TODO criar função de busca"

-- FUNÇÕES RELACIONADAS COM A PESQUISA POR JOGADORES
compararJogadores :: IO()
compararJogadores = comparaJogadoresMenu

comparaPontos :: Int -> Int -> String
comparaPontos jogUm jogDois =
  -- TODO
    -- NESSE PONTO DEVE SER ADICIONADA A FUNÇÃO PARA BUSCAR A PONTUAÇÃO DE CADA JOGADOR
    -- E SER PASSADA PARA O MÓDULO DE PONTUAÇÃO PARA COMPARAR MAIS OU MENOS ASSIM
    -- if ((Pontuacao.compararPontuacao pegarPontos(JogUm) pegarPontos(JogDois)) == True)
  if (Pontuacao.compararPontuacao 1001 1000 == True)
  then "Jogador 1 é melhor"
  else "Jogador 2 é melhor"

comparaJogadoresMenu :: IO()
comparaJogadoresMenu = do
  putStrLn "Insire o ID de dois jogadores para saber as chances de vitória de cada um caso eles"
  putStrLn "joguem um contro o outro (Ou digite 0 para voltar ao menu anterior)"
  putStrLn "Jogador 1:"
  jogadorUm <- getLine
  putStrLn "Jogador 2:"
  jogadorDois <- getLine

  if jogadorUm == "0" || jogadorDois == "0"
  then
    return ()
  else
    print (comparaPontos (read jogadorUm) (read jogadorDois))
  
