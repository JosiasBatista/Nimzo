module MatchUtil where

data Match = Match {white :: Player,
                    black :: Player,
                    idGame :: Integer,
                    result :: Char} deriving Show



data Player = Player {name :: String,
                      idPlayer :: Integer,
                      elo :: Double,
                      matches :: [Match]} deriving Show

playerToString :: Player -> Bool -> String
playerToString player showMatches =
  name' ++ "," ++ idPlayer' ++ "," ++ elo'
  where
    name' = name player
    idPlayer' = show (idPlayer player)
    elo' = show (elo player)

matchToString :: Match -> String
matchToString match =
  "(" ++ playerToString playerW False ++ "),(" ++ playerToString playerB False ++ ")," ++ idGame' ++ ","
  where
    playerW = white match
    playerB = black match
    idGame' = show (idGame match)
    result' = show (result match)

addMatch :: Player -> Match -> Player
addMatch player' match' = Player {name=name player', idPlayer=idPlayer player', elo=elo player', 
matches=match' : matches player'}

setElo :: Player -> Double -> Player
setElo player elo' = Player {name=name player, idPlayer=idPlayer player, elo=elo',
matches=matches player}

createPlayer :: String -> Integer -> Player
createPlayer name' idPlayer' = Player {name=name', idPlayer=idPlayer', elo=1200, matches=[]}

updateList :: [a] -> Int -> [a] -> [a]
updateList element pos list = front ++ element ++ end where
    front = take (pos - 1) list  
    end = drop pos list
