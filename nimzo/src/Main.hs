module Main where

import Storage

import Menu 

main :: IO ()
main = do
  database <- load
  menu database