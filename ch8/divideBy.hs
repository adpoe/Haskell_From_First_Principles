dividedBy :: Integeral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n   d count
      | n < d = (count, n)
      | otherwise = go (n - d) d (count + 1)

sumToN (Eq a, Num a) => a -> a
sumToN 0 = 0
sumToN n = go n d 0
  where go n  d count
    | count >= n = d
    | otherwise =  go n (d + count) (count + 1)
