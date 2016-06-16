data Mood = Blah deriving Show

instance Show Mood where
  show _ = "Blah"


-- Typeclass Instances we can always derive
-- Eq, Ord, Enum, Bounded, Read, and Show

-- Avoid using Read, because it is a *partial function**
-- and it can cause runtime errors on invalid input...
-- which goes against what we're trying to do with Haskell
