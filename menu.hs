module Menu where

printMenu :: IO ()
printMenu = do
    putStrLn "Bem vindo ao Nimzo"
    putStrLn "Escolha uma das opções abaixo:" 
    putStrLn " 1 - Cadastrar novo jogador"
    putStrLn " 2 - Adicionar uma partida"
    putStrLn " 3 - Pesquisar por um jogador"
    putStrLn " 4 - Comparar dois jogadores"
    putStrLn " 5 - Sair do programa"

menuRead :: IO ()
menuRead = do
    
