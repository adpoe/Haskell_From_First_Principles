-- arith2.hs
module Arith2 where

add :: Int -> Int -> Int
add x y = x + y

addPF :: Int -> Int -> Int
addPF = (+)

addOne :: Int -> Int
addOne = \x -> x + 1

addOnePf :: Int -> Int
addOnePf = (+1)

main :: IO ()
main = do
  print (0 :: Int)
  print (add 1 0)
  print (addOne 0)
  print (addOnePf 0)
  print ((addOne . addOne) 0)
  print ((addOnePf . addOne) 0)
  print ((addOnePf . addOnePf) 0)
  print ((negate . addOne) 0)
  print ((addOne . addOne . addOne
          . negate . addOne) 0)
