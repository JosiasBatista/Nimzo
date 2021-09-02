module Menu where

import System.Exit (exitSuccess)

menu :: IO ()
menu = do
      putStrLn . unlines $ map concatNums choices
      choice <- getLine
      case validate choice of
         Just n  -> execute . read $ choice
         Nothing -> putStrLn "Invalid option! Please try again"

      menu
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
   ("Cadastrar um novo jogador", addPlayer)
 , ("Adicionar uma partida", addMatch)
 , ("Pesquisar por um jogador", searchPlayer)
 , ("Comparar dois jogadores", comparePlayers)
 , ("Sair do programa", quit)
 ]

execute :: Int -> IO ()
execute n = doExec $ filter (\(i, _) -> i == n) choices
   where doExec ((_, (_,f)):_) = f

addPlayer = undefined
addMatch = undefined 
searchPlayer = undefined 
comparePlayers = undefined 
quit = 
    --Colocar o comando para salvar os arquivos aqui
    exitSuccess 