{-# LANGUAGE ConstraintKinds #-}
module PlayerUtil where

data Player = Player {name :: String,
                      idPlayer :: Integer,
                      elo :: Rational,
                      matches :: [Match]} deriving(Show)

addMatch :: Player -> Match -> Player
addMatch player' match' = Player {name=name player', idPlayer=idPlayer player', elo=elo player', 
matches=match' : matches player'}

setElo :: Player -> Rational -> Player
setElo player elo' = Player {name=name player, idPlayer=idPlayer player, elo=elo',
matches=matches player}

createPlayer :: String -> Integer -> Player
createPlayer name' idPlayer' = Player {name=name', idPlayer=idPlayer', elo=1200, matches=[]}

--Remover definição de match depois
data Match = Match {idMatch :: Integer} deriving(Show)