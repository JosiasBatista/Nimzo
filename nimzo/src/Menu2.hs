module Menu where

import Control.Monad (forever)
import System.Exit (exitSuccess)
import MatchUtil
import Storage


menu :: Database -> IO ()
menu database = forever $ do
    putStrLn "Bem vindo ao Nimzo"
    putStrLn "Escolha uma das opções abaixo"
    putStrLn "1 - Cadastrar um novo jogador"
    putStrLn "2 - Adicionar uma partida"
    putStrLn "3 - Pesquisar por um jogador"
    putStrLn "4 - Comparar dois jogadores"
    putStrLn "5 - Sair do programa"

    option <- getLine

    case option of
        "1" -> addPlayerMenu database
        "2" -> addGame database
        "3" -> searchPlayer database
        "4" -> comparePlayers database
        "5" -> quit
        _   -> putStrLn "Opção inválida! Por favor, selecione novamente."


addPlayerMenu  database = do
    putStrLn "insira o nome do jogador que você quer cadastrar,\nou digite '0' para retornar ao menu anterior"
    name <- getLine
    if name == "0"
        then return ()
    else
        undefined 


addPlayer :: [Player] -> String -> [Player]
addPlayer players name = player : players where
    player = createPlayer name (toInteger  (length players + 1))
addGame database = undefined
searchPlayer database = undefined
comparePlayers database = undefined
quit =
    --Colocar o comando para salvar os arquivos aqui
    exitSuccess