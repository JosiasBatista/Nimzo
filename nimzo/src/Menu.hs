module Menu where

import System.IO.Unsafe (unsafePerformIO)
import Control.Monad (forever)
import System.Exit (exitSuccess)
import MatchUtil
import Storage
import EloUtil

menuSelection o
    | o == "1"  = addPlayerMenu
    | o == "2"  = addGame
    | o == "3"  = searchPlayer
    | o == "4"  = comparePlayers
    | o == "5"  = quit
    | otherwise  = invalid


menu :: IO Database -> IO Database
menu database = do
    putStrLn "Bem vindo ao Nimzo"
    putStrLn "Escolha uma das opções abaixo"
    putStrLn "1 - Cadastrar um novo jogador"
    putStrLn "2 - Adicionar uma partida"
    putStrLn "3 - Pesquisar por um jogador"
    putStrLn "4 - Comparar dois jogadores"
    putStrLn "5 - Sair do programa"

    option <- getLine

    newDatabase <- menuSelection option database
    menu (return newDatabase)


addPlayerMenu :: IO Database -> IO Database
addPlayerMenu  database = do
    putStrLn "insira o nome do jogador que você quer cadastrar,\nou digite '0' para retornar ao menu anterior"
    name <- getLine
    case name of
        "0" -> database
        _   -> addPlayer database name


addPlayer :: IO Database  -> String -> IO Database
addPlayer database name = newDatabase where
    newDatabase = return(Database {matches_db=matches_db (unsafePerformIO database), players_db= player : players_db (unsafePerformIO database)})
    player = createPlayer name (toInteger  (length (players_db(unsafePerformIO database) )  + 1))

addGame :: IO Database -> IO Database
addGame database = do
    putStrLn "Insira as informações da partida:"
    putStrLn "ID do jogador com peças brancas: "
    idBrancas <- getLine
    let idw = read idBrancas :: Integer
    let pw = head (filter (\x -> idPlayer x == idw) (players_db (unsafePerformIO database)))

    putStrLn "ID do jogador com peças pretas: "
    idPretas <- getLine
    let idb = read idPretas :: Integer
    let pb = head (filter (\x -> idPlayer x == idb) (players_db (unsafePerformIO database)))
    putStrLn "Vencedor (b - branco, p - preto, e - empate): "
    resultado <- getLine

    let match = Match {white=pw, black=pb, idGame= toInteger (length (matches_db (unsafePerformIO database)) + 1), result= head resultado}
    let pw_updated = addMatch pw match
    let pb_updated = addMatch pb match

    let pos1 = toInteger (length (players_db (unsafePerformIO database))) - idPlayer pw + 1
    let pos2 = toInteger (length (players_db (unsafePerformIO database))) - idPlayer pb + 1

    let elo1 = elo pw_updated
    let elo2 = elo pb_updated
    let newElo = adjustElo elo1 elo2 (head resultado)
    let pw_updated2 = setElo pw_updated (fst newElo)
    let pb_updated2 = setElo pb_updated (snd newElo)

    let newPlayers1 = updateList [pw_updated2] (fromInteger pos1) (players_db (unsafePerformIO database))
    let newPlayers2 = updateList [pb_updated2] (fromInteger pos2) newPlayers1



    let newDatabase = Database {matches_db= match : matches_db (unsafePerformIO database), players_db=newPlayers2}
    return newDatabase

searchPlayer :: IO Database -> IO Database
searchPlayer database = do
    putStrLn "Digite o nome do jogador que você está buscando:"
    name_s <- getLine
    let results = filter (\x -> name x == name_s) (players_db (unsafePerformIO database))
    putStrLn "Foram encontrados os seguintes Jogadores com esse nome:"
    mapM_ print results

    return (unsafePerformIO database)


comparePlayers database = do
    putStrLn "Insira o ID de dois jogadores para saber as chances de vitória de cada um, se eles jogarem um contra o outro:"
    putStr "Id do jogador1: "
    id1 <- getLine
    putStr "Id do jogador2: "
    id2 <- getLine

    let pos1 = toInteger (length (players_db (unsafePerformIO database))) - read id1 + 1
    let elo1 = elo (players_db (unsafePerformIO database) !! fromInteger (pos1 - 1))
    

    let pos2 = toInteger (length (players_db (unsafePerformIO database))) - read id2 + 1
    let elo2 = elo (players_db (unsafePerformIO database) !! fromInteger (pos2 - 1))

    let wr = winExp elo2 elo1
    putStr "Chances do jogador1 ganhar: "
    print wr
    putStr "Chances do jogador2 ganhar: "
    print (1 - wr)

    database

quit database =
    --Colocar o comando para salvar os arquivos aqui
    exitSuccess

invalid :: IO Database -> IO Database
invalid database = do
     putStrLn "Opção inválida! Por favor, selecione novamente."
     return (unsafePerformIO database)