module NFL.Data.Team where

import Prelude
import Data.Foreign.Class (class IsForeign, readProp)

newtype Team = Team
  { id :: String
  , name :: String
  , city :: String
  }

instance showTeam :: Show Team where
  show (Team {id, name, city}) =
    "(Team " <> show id <> " " <> city <> " " <> name <> ")"

instance teamIsForeign :: IsForeign Team where
  read value = do
    id <- readProp "id" value
    name <- readProp "name" value
    city <- readProp "city" value
    pure $ Team { id, name, city }
