module Main where

import Storage

import Menu

main :: IO Database
main = do
  --database <- load
  menu load 0
