module Cipher where
import Data.Char
baseUnicode = ord 'A'
endUnicode  = ord 'z'
modValue    = endUnicode - baseUnicode


-- Caesar cipher
caesar :: [Char] -> [Char]
caesar []     = []
caesar (x:xs) =  shiftedChar : caesar xs
  where baseUnicode = ord 'A'
        endUnicode  = ord 'z'
        modValue    = endUnicode - baseUnicode
        charAsInt   = ord x
        shiftedInt  = ((charAsInt + 13) `mod` (baseUnicode + modValue))
        shiftedChar = chr shiftedInt

uncaesar :: [Char] -> [Char]
uncaesar []        = []
uncaesar (x:xs)    = unShiftedChar : uncaesar xs
  where baseUnicode = ord 'A'
        endUnicode  = ord 'z'
        modValue    = endUnicode - baseUnicode
        charAsInt   = ord x
        shiftedInt  = ((charAsInt - 13) `mod` (baseUnicode + modValue))
        unShiftedChar = chr shiftedInt


