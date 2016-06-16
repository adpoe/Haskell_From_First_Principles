sayHello :: String -> IO ()
sayHello x = putStrLn("Hello, " ++ x ++ "!")

triple :: Integer -> Integer
triple x = x * 3

half x = x / 2

square x = x * x


-- 2.4.2
piTimesSquare x = 3.14 * (x * x)


foo x =
  let y = x * 2
      z = x ^ 2
  in 2 * y * z

