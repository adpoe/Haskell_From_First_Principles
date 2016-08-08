doubleUp :: [a] -> [a]
doubleUp [] = []
doubleUp xs@(x:_) = x : xs
-- Can match the WHOLE pattern to the variable at front using @

