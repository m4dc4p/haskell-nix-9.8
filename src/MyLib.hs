{-# OPTIONS_GHC -fplugin=Polysemy.Plugin #-}
module MyLib (someFunc) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"
