-- exercises.hs
module Reverse where
module ExercisesCh3 where

sameString :: String -> String
sameString x = take 1000 x

takeThird :: String -> Char
takeThird x = x !! 3

takeFourth :: String -> Char
takeFourth x = x !! 4

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome!" !! x

split :: Eq a => a -> [a] -> [[a]]
split d [] = []
split d s = x : split d (drop 1 y) where (x,y) = span (/= d) s

rvrs :: String
rvrs = awesome ++ is ++ curry
  where
    curryIsAwesome = "Curry is Awesome"
    awesome = drop 9 curryIsAwesome
    is = take 4 $ drop 5 curryIsAwesome
    curry = take 5 curryIsAwesome

--rvrs' String -> String
--rvrs' x = 

main :: IO ()
main = print (rvrs "Curry is Awesome")

