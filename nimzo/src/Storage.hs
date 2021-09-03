module Storage where

import MatchUtil
import System.IO.Unsafe (unsafePerformIO)

type Matches = [Match]
type Players = [Player]

data Database = Database {matches_db :: Matches, players_db :: Players} deriving Show

appendLine :: String -> String -> IO()
appendLine newLine file = appendFile file (newLine ++ "\n")

save :: IO Database -> IO()
save database = do
  savePlayerList database
  saveMatchesList database
-- essa função vai salvar em algum arquivo .txt os jogadores e jogos

readFile :: String -> IO [String]
readFile fileSrc = do
  file <- Strict.readFile fileSrc
  let lines = lines file
  return lines

loadPlayers :: [String] -> [Player]
loadPlayers fileLines = [parsePlayer line | line <- lines]

parsePlayer :: String -> Player
parsePlayer line =
  Player {
    Player.name = head data',
    Player.idPlayer = data' !! 1,
    Player.elo = data' !! 2
  }
  where
    data' = splitOn "," line

load :: IO Database
load = return(Database {matches_db=[], players_db=[]})
-- Carregar database de algum arquivo

saveMatchesList:: IO Database -> IO()
saveMatchesList database = saveMatch (matches_db (unsafePerformIO database))

saveMatch :: [Match] -> IO()
saveMatch [] = return ()
saveMatch (h:t) = do
  appendLine (matchToString h) "./database/matches.csv"
  saveMatch t

savePlayerList :: IO Database -> IO()
savePlayerList database = savePlayer (players_db (unsafePerformIO database))

savePlayer :: [Player] -> IO()
savePlayer [] = return ()
savePlayer (h:t) = do
  appendLine (playerToString h False) "./database/players.csv"
  savePlayer t
