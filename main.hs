import Jogador
import Partida

main :: IO ()
main = do
  putStrLn "Escolha a funcionalidade desejada:" 
  putStrLn " 1 - Adicionar Jogador"
  putStrLn " 2 - Adicionar Partida"
  putStrLn " 3 - Pesquisar Jogador"
  putStrLn " 4 - Comparar Jogadores"
  putStrLn " 5 - Sair"
  choice <- getLine

  case choice of
    "1" -> do
      putStrLn Jogador.adicionarJogador
      main
    "2" -> do 
      putStrLn Partida.adicionarPartida
      main
    "3" -> do
      putStrLn Jogador.pesquisarJogador
      main
    "4" -> do
      putStrLn Jogador.compararJogadores
      main
    "5" -> do
      putStrLn "Encerrando execução"
    _   -> do
      putStrLn "Insira uma funcionalidade válida"
      main
