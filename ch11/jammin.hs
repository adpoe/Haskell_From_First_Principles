module Jammin where
import Data.List

data Fruit =
    Peach
  | Plum
  | Apple
  | Blackberry
  deriving (Eq, Show, Ord)

data JamJars =
  Jam Fruit Int
  deriving (Eq, Show, Ord)

data JamJars' =
  Jam' {
  jam :: Fruit
  , num :: Int }
  deriving (Eq, Show, Ord)

row1 = Jam' Peach 10
row2 = Jam' Plum 22
row3 = Jam' Apple 63
row4 = Jam' Blackberry 29
row5 = Jam' Peach 12
row6 = Jam' Blackberry 2
allJam = [row1, row2, row3, row4, row5, row6]

totalJars :: [JamJars'] -> Int
totalJars jarList = sum . getList $ jarList

getList :: [JamJars'] -> [Int]
getList []                = []
getList ((Jam' _ num):xs) = num : getList xs


mostRow :: [JamJars'] -> JamJars'
mostRow = maximumBy (\jars1 jars2 -> compare (num jars1) (num jars2))

compareKind (Jam' k _ ) (Jam' k' _ ) = compare k k'

sortJams :: [JamJars'] -> [JamJars']
sortJams list = sortBy compareKind list

groupJams :: [JamJars'] -> [[JamJars']]
groupJams list = groupBy (\x y -> isKind x y) . sortJams $ list
-- Need to sort before grouping... groupBy just goes through and divides things into a new group (sublist)
-- as soon as it hits a false

isKind (Jam' k _) (Jam' k' _) = k == k'
