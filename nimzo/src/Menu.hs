module Menu where

import Control.Monad (forever)
import System.Exit (exitSuccess)
import MatchUtil
import Storage


menu :: Database -> IO ()
menu database = forever $ do
      putStrLn . unlines $ map concatNums choices
      choice <- getLine
      case validate choice of
         Just n  -> execute . read $ choice 
         Nothing -> putStrLn "Invalid option! Please try again"

      return ()
   where concatNums (i, (s, _)) = show i ++ ".) " ++ s

validate :: String -> Maybe Int
validate s = isValid (reads s)
   where isValid []            = Nothing
         isValid ((n, _):_)
               | outOfBounds n = Nothing
               | otherwise     = Just n
         outOfBounds n = (n < 1) || (n > length choices)

choices :: [(Int, (String, IO ()))]
choices = zip [1.. ] [
   ("Cadastrar um novo jogador", addPlayerMenu)
 , ("Adicionar uma partida", addGame)
 , ("Pesquisar por um jogador", searchPlayer)
 , ("Comparar dois jogadores", comparePlayers)
 , ("Sair do programa", quit)
 ]

execute :: Int -> IO ()
execute n = doExec $ filter (\(i, _) -> i == n) choices
   where doExec ((_, (_,f)):_) = f


addPlayerMenu = do
    putStrLn "insira o nome do jogador que você quer cadastrar,\nou digite '0' para retornar ao menu anterior"
    name <- getLine
    if name == "0"
        then return ()
    else
        undefined 


addPlayer :: [Player] -> String -> [Player]
addPlayer players name = player : players where
    player = createPlayer name (toInteger  (length players + 1))
addGame = undefined
searchPlayer = undefined
comparePlayers = undefined
quit =
    --Colocar o comando para salvar os arquivos aqui
    exitSuccess