module NFL.Data.Stadium where

import Prelude
import Data.Foreign.Class (class IsForeign, readProp)

newtype Stadium = Stadium
  { name :: String
  , capacity :: Int
  , city :: String
  }

instance showStadium :: Show Stadium where
  show (Stadium {name, city}) =
    "(Stadium " <> name <> " in " <> city <> ")"

instance stadiumIsForeign :: IsForeign Stadium where
  read value = do
    name <- readProp "name" value
    capacity <- readProp "capacity" value
    city <- readProp "city" value
    pure $ Stadium { name, capacity, city }
