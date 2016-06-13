data Maybe a = Nothing | Just a

f :: Bool -> Maybe Int
F False = Just 0
f _ = Nothing
