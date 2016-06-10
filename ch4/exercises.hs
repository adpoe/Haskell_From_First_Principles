myAbs :: Integer -> Integer
myAbs x =
  if x >= 0
    then x
  else
    (*) (-1) x

f :: (a, b) -> (c,d) -> ((b,d), (a,c))
f x y = ( ((snd x), (snd y)), ((fst x), (fst y)) )

x = (+)

f' xs = x w 1
  where w = length xs
