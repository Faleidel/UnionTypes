{-# LANGUAGE ViewPatterns, FlexibleInstances #-}

module Main where

import Data.Typeable

class (Typeable a) => UnionBoolAndList a where
    -- Is it possible to have a class without a body?
    -- I am using class as a way to define a constrain on the type of an argument, not
    -- to have member functions.
    id :: a -> a

instance UnionBoolAndList ([Bool]) where
    id x = x

instance UnionBoolAndList Bool where
    id x = x

f :: (UnionBoolAndList a) => a -> String
-- warning, the type inference is deciding what is the type of "cast".
f (cast -> Just x) = showBoolList x
f (cast -> Just x) = showBool x

showBoolList :: [Bool] -> String
showBoolList x = show x

showBool :: Bool -> String
showBool x = show x

main = do
    putStrLn $ f True
    putStrLn $ f [True,False]