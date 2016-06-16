data OperatingSystem =
        GnuPlusLinux
      | OpenBSDPlusNevermindJustBSDStill
      | Mac
      | Windows
      deriving ( Eq , Show )

data ProgrammingLanguage =
        Haskell
      | Agda
      | Idris
      | PureScript
      deriving (Eq, Show)

data Programmer =
  Programmer { os :: OperatingSystem
              , lang :: ProgrammingLanguage}
  deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem]
allOperatingSystems = [GnuPlusLinux, OpenBSDPlusNevermindJustBSDStill, Mac, Windows]

allProgrammingLangs :: [ProgrammingLanguage]
allProgrammingLangs = [Haskell, Agda, Idris, PureScript]

allProgrammers :: [Programmer]
allProgrammers = [ Programmer x y | x<-allOperatingSystems, y<-allProgrammingLangs]
