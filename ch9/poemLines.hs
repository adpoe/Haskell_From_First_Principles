module PoemLines where
import Data.List

-- Learned from this:  Be careful when defining things like myLines and myLines'... and then doing recursion
-- and calling the wrong function!!!

firstSen  = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen  = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful symmetry?"
sentences = firstSen ++ secondSen
         ++ thirdSen ++ fourthSen

myWords :: String -> [String]
myWords x = words x

myLines :: String -> [String]
myLines ""  = []
myLines sen = nextWord : myLines cleanedSen
  where nextWord = takeWhile  (/= '\n') sen
        newSen   = dropWhile (/= '\n') sen
        cleanedSen = dropWhile (== '\n') newSen

shouldEqual = [ "Tyger Tyger, burning bright",
                "In the forests of the night",
                "What immortal hand or eye",
                "Could frame thy fearful symmetry?" ]

main :: IO ()
main =
  print $ "Are they equal? "
            ++ show (myLines sentences == shouldEqual)
