module Storage where

import MatchUtil

type Matches = [Match]
type Players = [Player]

data Database = Database {matches_db :: Matches, players_db :: Players}

save :: Database -> IO ()
save a = undefined
-- essa função vai salvar em algum arquivo .txt os jogadores e jogos

load :: Database
load = Database {matches_db=[], players_db=[]}
-- Carregar database de algum arquivo