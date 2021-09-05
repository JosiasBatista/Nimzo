module Storage where

import MatchUtil
import System.IO.Unsafe (unsafePerformIO)
import qualified System.IO.Strict as SIO
import Data.List.Split (splitOn)

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
  file <- SIO.readFile fileSrc
  let linesList = lines file
  return linesList

loadMatches :: [String] -> [Match]
loadMatches fileLines = [parseMatch line | line <- fileLines]

parseMatch :: String -> Match
parseMatch line =
  MatchUtil.Match {
    white = parsePlayer (filter (not . (`elem` ")(")) (head data')),
    black = parsePlayer (filter (not . (`elem` ")(")) (data' !! 1)),
    idGame = read (data' !! 2) :: Integer,
    result = read (data' !! 3)
  }
  where 
    data' = splitOn "," line

loadPlayers :: [String] -> [Player]
loadPlayers fileLines = [parsePlayer line | line <- fileLines]

parsePlayer :: String -> Player
parsePlayer line =
  MatchUtil.Player {
    name = head data',
    idPlayer = read (data' !! 1) :: Integer,
    elo = read (data' !! 2) :: Double,
    matches = []
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
savePlayerList database = do
  savePlayer (players_db (unsafePerformIO database))

savePlayer :: [Player] -> IO()
savePlayer [] = return ()
savePlayer (h:t) = do
  putStrLn (playerToString h False)
  appendLine (playerToString h False) "./database/players.csv"
  savePlayer t
