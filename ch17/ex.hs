--Validate a Person with Applicative Functors
data Person =
  Person Name Address
  deriving (Eq, Show)

mkperson :: String -> String -> Maybe Person
mkperson n a =
  Person <$> mkName n <*> mkAddress a

validateLength :: Int -> String -> Maybe String
validateLength maxLen s =
  if (length s) > maxLen
  then Nothing
  else Just s

newtype Name =
  Name String deriving (Eq, Show)

newtype Address =
  Address String deriving (Eq, Show)

mkName :: String -> Maybe Name
mkName s = fmap Name $ validateLength 25 s
-- The Name newtype is really a function, a data constructor
-- So, when we fmap Name over the result of Validate, then
-- if it's Nothing, we simply get a Nothing value in return
-- if it's a Just "anything", we'll wrap the interior string with a Name

mkAddress :: String -> Maybe Address
mkAddress a = fmap Address $ validateLength 100 a


-- Before we mooooooove on...
data Cow = Cow {
      name   :: String
    , age    :: Int
    , weight :: Int
} deriving (Eq, Show)

noEmpty :: String -> Maybe String
noEmpty ""  = Nothing
noEmpty str = Just str

noNegative :: Int -> Maybe Int
noNegative n | n >= 0 = Just n
             | otherwise = Nothing

-- Validating to get rid of empty strings, negative numbers
cowFromString :: String -> Int -> Int -> Maybe Cow
cowFromString name' age' weight' =
  case noEmpty name' of
    Nothing -> Nothing
    just nammy ->
      case noNegative age' of
        Nothing -> Nothing
        just agey ->
          case noNegative weight' of
            Nothing -> Nothing
              Just weighty ->
                Just (Cow nammy agey weighty)
-- This is bad... but we can improve using applicative functors

import Control.Applicative
cowFromString' :: String -> Int -> Int -> Maybe Cow
cowFromString' name' age' weight' =
  Cow <$> noEmpty name' -- Always lift the first one with the cash money operator, then use tie fighter
      <*> noNegative age'
      <*> noNegative weight'
      -- Using the infix <$> fmap operator first makes a partially applied function, and we can finish applying it with <*>
      -- until we're done, and it returns a value. Data constructors, like Cow, are functions too. So that's why this works.

-- OR.. the super cool way
cowFromString'' String -> Int -> Int -> Maybe Cow
cowFromString'' name' age' weight' =
  liftA3 Cow (noEmpty name')
             (noNegative age')
             (noNegative weight')



