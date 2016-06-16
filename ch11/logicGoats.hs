{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

newtype Goats =
  Goats Int deriving (Eq, Show, TooMany)


-- Exercises
instance TooMany (Int, String) where
  tooMany (n, s) = n > 42
  -- NOTE:  Need to add the FlexibleInstances extension at top of file for this to work

instance TooMany (Int, Int) where
  tooMany (n, m) = (n + m) > 42


