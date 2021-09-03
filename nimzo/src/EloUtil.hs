module EloUtil where

import System.Exit (exitFailure)



winExp elo1 elo2 =
    1.0 / (1.0 + 1.0 * (10 ** (1.0 * (elo1 - elo2) / 400)))

adjustElo elo1 elo2 result =
    (elo1 + k * (score - p1), elo2 - k * (score - p1)) where
        score = convertResult result
        k = 30
        p1 = winExp elo1 elo2


convertResult r
    | r == 'b' = 1.0
    | r == 'p' = 0.0
    | r == 'e' = 0.5


