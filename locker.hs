
import qualified Data.Map as Map

--data Either a b = Left a | Right b deriving(Eq,Ord,Read,Show)

data LockerState = Taken | Free deriving (Show, Eq)

type Code= String

type LockerMap = Map.Map Int (LockerState, Code)


lockerLookup :: Int -> LockerMap -> Either String Code

lockerLookup lockerNumber map = 
	case Map.lookup  lockerNumber map of
		Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " does not exists"
		Just(state,code) -> if state /= Taken then
								Right code
							else
								Left $ "Locker " ++ show lockerNumber ++ " is already taken"


