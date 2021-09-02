module Storage where

import MatchUtil

type Matches = [Match]
type Players = [Player]

data Database = Database {matches :: Matches, players :: Players}

save :: Database -> IO ()
save a = undefined 
-- essa função vai salvar em algum arquivo .txt os jogadores e jogos

load = undefined 
-- Carregar database de algum arquivo