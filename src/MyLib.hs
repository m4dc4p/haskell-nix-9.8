{-# OPTIONS_GHC -fplugin=Debug.Breakpoint #-}
module MyLib (someFunc) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"
