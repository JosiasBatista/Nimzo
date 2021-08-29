import Jogador
import Partida

main :: IO ()
main = do
  putStrLn "Bem vindo ao Nimzo"
  putStrLn "Escolha uma das opções abaixo:" 
  putStrLn " 1 - Cadastrar novo jogador"
  putStrLn " 2 - Adicionar uma partida"
  putStrLn " 3 - Pesquisar por um jogador"
  putStrLn " 4 - Comparar dois jogadores"
  putStrLn " 5 - Sair do programa"
  choice <- getLine

  case choice of
    "1" -> do
      Jogador.adicionarJogador
      main
    "2" -> do 
      Partida.adicionarPartida
      main
    "3" -> do
      Jogador.pesquisarJogador
      main
    "4" -> do
      Jogador.compararJogadores
      main
    "5" -> do
      putStrLn "Obrigado por utilizar o Nimzo!"
    _   -> do
      putStrLn "Opção inválida! Por favor, selecione novamente."
      main
