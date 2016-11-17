module NFL.Data.Player where

import Prelude
import Data.Foreign.Class (class IsForeign, readProp)
import Data.Foreign.Index (prop)

newtype Player = Player
  { id :: Int
  , name :: String
  , birthdate :: String
  , position :: String
  , height :: Number
  , weight :: Number
  , city :: String
  , university :: String
  }

instance playerIsForeign :: IsForeign Player where
  read value = do
    id <- readProp "id" value
    name <- readProp "name" value
    birthdate <- readProp "birthdate" value
    position <- readProp "position" value
    height <- readProp "height" value
    weight <- readProp "weight" value
    city <- prop "city" value >>= readProp "name"
    university <- prop "university" value >>= readProp "name"
    pure $ Player { id, name, birthdate, position, height, weight, city, university }
