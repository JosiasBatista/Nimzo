import MatchUtil

type Matches = [Match]
type Players = [Player]

data Database = Database {matches :: Matches, players :: Players}

save = undefined