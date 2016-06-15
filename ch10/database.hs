import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
             (fromGregorian 1911 5 1)
     (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hello, world!"
  , DbDate (UTCTime
            (fromGregorian 1921 5 1)
            (secondsToDiffTime 34123))
  ]

extractDate :: DatabaseItem -> UTCTime
extractDate (DbDate x) = x

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate []               = []
filterDbDate ((DbDate x):xs)  = x : filterDbDate xs
filterDbDate (_:xs)           = filterDbDate xs

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber []                   = []
filterDbNumber ((DbNumber x):xs)    = x : filterDbNumber xs
filterDbNumber (_:xs)               = filterDbNumber xs


mostRecent :: [DatabaseItem] -> UTCTime
mostRecent xs = maximum . filterDbDate $ xs


sumDb :: [DatabaseItem] -> Integer
sumDb input = foldl (+) 0 numberList
  where
    numberList = filterDbNumber input

avgDb :: [DatabaseItem] -> Double
avgDb db = (fromIntegral (sumDb db)) / (fromIntegral (length db))

