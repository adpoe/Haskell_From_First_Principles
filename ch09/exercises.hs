module ExercisesCh9 where
import Data.Char

capitalize :: String -> String
capitalize ""        = ""
capitalize (x:[])    = toUpper x : []
capitalize (x:xs)    = toUpper x : xs

allcaps :: String -> String
allcaps ""        = ""
allcaps (x:[])    = toUpper x : []
allcaps (x:xs)    = toUpper x : allcaps xs

myHead :: [Char] -> Char
myHead  []        = ' '
myHead (x:_)      = toUpper x

