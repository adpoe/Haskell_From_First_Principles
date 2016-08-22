module EitherMonad where

--years ago
type Founded = Int
-- number of programmers
type Coders = Int

data SoftwareShop =
  Shop {
    founded     :: Founded
  , programmers :: Coders
} deriving (Eq, Show)

data FoundedError =
    NegativeYears Founded
  | TooManyYears Founded
  | NegativeCoders Coders
  | TooManyCoders Coders
  | TooManyCodersForYears Founded Coders
  deriving (Eq, Show)

validateFounded :: Int -> Either FoundedError Founded
validateFounded n
  | n < 0     = Left $ NegativeYears n
  | n > 500   = Left $ TooManyYears n
  | otherwise = Right n

validateCoders :: Int -> Either FoundedError Coders
validateCoders n
  | n < 0       = Left $ NegativeCoders n
  | n > 5000    = Left $ TooManyCoders n
  | otherwise   = Right n

mkSoftware :: Int -> Int -> Either FoundedError SoftwareShop
mkSoftware years coders = do
  founded       <- validateFounded years
  programmers   < validateCoders coders
  if programmers > div founded 10
    then Left $ TooManyCodersForYears founded programmers
    else Right $ Shop founded programmers


-- Either implementation
data Sum a b =
    First a
  | Second b
  deriving (Eq, Show)

instance Functor (Sum a) where
  fmap _ (First a) = First a
  fmap f (Second a) = Second (f a)
  -- for functor, if we get a function, lift it into the structure

instance Applicative (Sum a) where
  pure =  Second
  (<*>) _ (First a) = First a
  (<*>) (First a) _ = First a
  (<*>) (Second f) (Second b) = Second (f b)
  -- Allows us to lift an already wrapped function

instance Monad (Sum a) where
  return = pure
  (>>=) (First a) _ = First a
  (>>=) (Second a) f = f a
  -- First is like Left
  -- Second is like Right


