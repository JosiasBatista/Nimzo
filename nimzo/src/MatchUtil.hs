module MatchUtil where

data Match = Match {white :: Player,
                    black :: Player,
                    idGame :: Integer,
                    result :: Char}



data Player = Player {name :: String,
                      idPlayer :: Integer,
                      elo :: Rational,
                      matches :: [Match]}

addMatch :: Player -> Match -> Player
addMatch player' match' = Player {name=name player', idPlayer=idPlayer player', elo=elo player', 
matches=match' : matches player'}

setElo :: Player -> Rational -> Player
setElo player elo' = Player {name=name player, idPlayer=idPlayer player, elo=elo',
matches=matches player}

createPlayer :: String -> Integer -> Player
createPlayer name' idPlayer' = Player {name=name', idPlayer=idPlayer', elo=1200, matches=[]}