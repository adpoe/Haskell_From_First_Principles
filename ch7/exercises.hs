f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f)) 
f (a, b, c) (d, e, f) =  ((a, d),(c,f))

tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

tensDigit' :: Integral a => a -> a
tensDigit' x = d
  where (a, b) = x `divMod`  10
        d = b

hunsDigit :: Integral a => a -> a
hunsDigit x = d
  where (a, b) = x `divMod`  100
        d = b

g :: (a -> b) -> (a, c) -> (b,c)
g f (a, c) = (f a, c)



