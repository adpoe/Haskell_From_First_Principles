import Data.Monoid


data Optional a =
    Nada
  | Only a
  deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
  mempty                = Nada
  mappend Nada (Only a) = Only a
  mappend (Only a) Nada = Only a
  mappend Nada Nada     = Nada
  mappend (Only a) (Only b) = Only (mappend a b)

-- QUICK CHECK
-- displays associative law
asc :: Eq a => (a -> a -> a) -> a -> a -> a -> Bool
asc (<>) a b c =
  a <> (b <> c) == (a <> b) <> c

monoidAssoc :: (Eq m, Monoid m) => m -> m -> m -> Bool
monoidAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

-- FixMe Functor - works
data FixMePls a =
    FixMe
  | Pls a
  deriving (Eq, Show)

instance Functor FixMePls where
  fmap _ FixMe = FixMe
  fmap f (Pls a) = Pls (f a)


--Good bad and ugly
data WhoCares a =
    ItDoesnt
  | Matter a
  | WhatThisIsCalled
  deriving (Eq, Show)

-- This fmap is law abiding, valid
instance Functor WhoCares where
  fmap _ ItDoesnt = ItDoesnt
  fmap _ WhatThisIsCalled = WhatThisIsCalled
  fmap f (Matter a) = Matter (f a)


-- This is bad
data CountingBad a =
  Heisenberg Int a
  deriving (Eq, Show)

instance Functor CountingBad where
  fmap f   (Heisenberg n a) = Heisenberg (n + 1) (f a)

-- Ths is okay
data CountingGood a =
  Heisenberg Int a
  deriving (Eq, Show)

instance Functor CountingGood where
  fmap f (Heisenberg n a) = Heisenberg (n) (f a)
  -- Don't mess with the Int in Heisenberg. We're only changing the a with FMAP
  -- Anything that isn't the final argument to our f is part of the STRUCTURE
  -- and fmap is for mapping over all elements in some arbitrary data structure,
  -- changing all values within, but leaving the structure itself intact, completely





