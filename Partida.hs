module Partida ( adicionarPartida ) where

adicionarPartida :: IO()
adicionarPartida = do
  putStrLn "Insira as informações da partida:"

  putStrLn "ID do jogador com peças brancas: "
  idBrancas <- getLine

  putStrLn "ID do jogador com peças pretas: "
  idPretas <- getLine

  putStrLn "Vencedor (b - branco, p - preto, e - empate): "
  putStrLn "Caso deseje voltar ao menu inicial digite '0'"
  resultado <- getLine

  if resultado == "0"
    then return ()
    else do
      putStrLn (adicionaPartida (read idBrancas) (read idPretas) resultado)
      putStrLn "\n"
      putStrLn "Deseja adicionar outra partida? [S/N]"

      resposta <- getLine
      gerenciaFluxo resposta

gerenciaFluxo :: String -> IO()
gerenciaFluxo resposta = if resposta == "N" then return() else adicionarPartida
      

adicionaPartida :: Int -> Int -> String -> String
adicionaPartida idBrancas idPretas resultado = "Partida adicionada /TODO criar função de adicionar partida"

