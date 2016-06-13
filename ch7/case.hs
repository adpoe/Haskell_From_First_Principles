funcZ x =
  case x + 1 == 1 of
    True -> "AWESOME"
    False -> "wut"

pal xs =
  case xs == reverse xs of
    True   -> "yes"
    False  -> "no"

functionC x y =
  case greaterThan of
    True   -> x
    False  -> y
  where greaterThan = x > y

ifEvenAdd2 n =
  case addTwo of
    True  -> n+2
    False -> n
  where addTwo = even n

nums x =
  case compare x 0 of
    LT -> -1
    GT -> 1
    EQ -> 0
