-- One
data TisAnInteger =
  TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn i) (TisAn i') =  i == i'



-- Two
data TwoIntegers =
  Two Integer Integer

instance Eq TwoIntegers where
  (==) (Two a b) (Two a' b') = (a,b) == (a',b')


-- Three
data StringOrInt =
    TisAnInt Int
  | TisAString String

instance Eq StringOrInt where
    (==) (TisAnInt x) (TisAnInt x') = x == x'
    (==) (TisAString y) (TisAString y') = y == y'
    (==) _ _ = False

-- Four
data Pair a =
  Pair a a

instance Eq a => Eq (Pair a) where
  (==) (Pair a b) (Pair a' b') = (a == a') && (b == b')

-- Five
data Tuple a b =
  Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple a b) (Tuple a' b') = (a == a') && (b == b')

-- Six
data Which a =
    ThisOne a
  | ThatOne a

instance (Eq a) => Eq (Which a) where
  (==) (ThisOne a) (ThisOne a') = a == a'
  (==) (ThatOne a) (ThatOne a') = a == a'
  (==)   _ _                    = False

-- Seven
data EitherOr a b =
    Hello a
  | GoodBye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello a) (Hello a') = a == a'
  (==) (GoodBye b) (GoodBye b') = b == b'
  (==) _ _                     = False
