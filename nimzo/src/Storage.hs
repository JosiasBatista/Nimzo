module Storage where

import MatchUtil

type Matches = [Match]
type Players = [Player]

data Database = Database {matches_db :: Matches, players_db :: Players} deriving Show

save :: Database -> IO ()
save a = undefined
-- essa função vai salvar em algum arquivo .txt os jogadores e jogos

load :: IO Database
load = return(Database {matches_db=[], players_db=[]})
-- Carregar database de algum arquivo