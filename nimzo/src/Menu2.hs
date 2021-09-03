module Menu2 where

import Control.Monad (forever)
import System.Exit (exitSuccess)
import MatchUtil
import Storage


menu :: Database -> IO Database
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
        _   -> invalid database


addPlayerMenu :: Database -> IO Database
addPlayerMenu  database = do
    putStrLn "insira o nome do jogador que você quer cadastrar,\nou digite '0' para retornar ao menu anterior"
    name <- getLine
    case name of
        "0" -> return database
        _   -> return(addPlayer database name)


addPlayer :: Database  -> String -> Database
addPlayer database name = newDatabase where
    newDatabase = Database {matches_db=matches_db database, players_db= player : players_db database}
    player = createPlayer name (toInteger  (length (players_db database)  + 1))

addGame database = undefined
searchPlayer database = undefined
comparePlayers database = undefined
quit =
    --Colocar o comando para salvar os arquivos aqui
    exitSuccess

invalid :: Database -> IO Database 
invalid database = do
     putStrLn "Opção inválida! Por favor, selecione novamente."
     return database