sumToN :: (Eq a, Num a) => a -> a
sumToN n
  | n == 0    = 0
  | otherwise = n + sumToN (n - 1)

mc91 :: (Ord a, Num a) => a -> a
mc91 x
  | x > 100 = x - 10
  | otherwise = mc91 . mc91 $ (x + 11)


