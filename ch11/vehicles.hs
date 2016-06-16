data Price =
  Price Integer deriving (Eq, Show)

data Manufacturer =
    Mini
  | Mazda
  | Tata
  deriving (Eq, Show)

data Airline =
    PapuaAir
  | CatapultsR'Us
  | TakeYourChancesUnited
  deriving (Eq, Show)

data Vehicle = Car Manufacturer Price
             | Plane Airline
             deriving (Eq, Show)

myCar     = Car Mini (Price 14000)
urCar     = Car Mazda (Price 20000)
clownCar  = Car Tata (Price 7000)
doge      = Plane PapuaAir

-- Functions to define
isCar :: Vehicle -> Bool
isCar (Car _ _ ) = True
isCar _          = False

isPlane :: Vehicle -> Bool
isPlane (Plane _)  = True
isPlane _          = False

areCars :: [Vehicle] -> [Bool]
areCars list = map isCar list

getManu :: Vehicle -> Manufacturer
getManu (Car manu _) = manu
getManu _            = error "Not a car"


