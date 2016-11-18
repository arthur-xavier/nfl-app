module NFL.Data.Team where

import Prelude
import Data.Foreign.Class (class IsForeign, readProp)
import Data.Foreign.Index (prop)

newtype Team = Team
  { id :: Int
  , name :: String
  , owner :: String
  , year :: String
  , city :: String
  }

instance showTeam :: Show Team where
  show (Team {id, name, owner, year, city}) =
    "(Team " <> show id <> " " <> name <> " from " <> city <> ")"

instance teamIsForeign :: IsForeign Team where
  read value = do
    id <- readProp "id" value
    name <- readProp "name" value
    owner <- readProp "owner" value
    year <- readProp "year" value
    city <- prop "city" value >>= readProp "name"
    pure $ Team { id, name, owner, year, city }
