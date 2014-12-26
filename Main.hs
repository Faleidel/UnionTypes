{-# LANGUAGE ViewPatterns, FlexibleInstances #-}

module Main where

import Data.Typeable

class (Typeable a) => UnionBoolAndList a where
    id :: a -> a

instance UnionBoolAndList ([Bool]) where
    id x = x

instance UnionBoolAndList Bool where
    id x = x

f :: (UnionBoolAndList a) => a -> String
f (cast -> Just x) = showBoolList x
f (cast -> Just x) = showBool x

showBoolList :: [Bool] -> String
showBoolList x = show x

showBool :: Bool -> String
showBool x = show x

main = do
    putStrLn $ f True
    putStrLn $ f [True,False]