module NFL.Data.Player where

import Prelude
import Data.Foreign.Class (class IsForeign, readProp)
import Data.Foreign.Index (prop)

type ShortTeamInfo =
  { id :: Int
  , name :: String
  }

newtype Player = Player
  { id :: Int
  , name :: String
  , birthdate :: String
  , position :: String
  , height :: Int
  , weight :: Int
  , city :: String
  , university :: String
  , team :: ShortTeamInfo
  }

instance showPlayer :: Show Player where
  show (Player {id, name, position, city, university}) =
    "(Player " <> show id <> " " <> name <> ", " <> position <>
    " from " <> city <> ", " <> university <> ")"

instance playerIsForeign :: IsForeign Player where
  read value = do
    id <- readProp "id" value
    name <- readProp "name" value
    birthdate <- readProp "birthdate" value
    position <- readProp "position" value
    height <- readProp "height" value
    weight <- readProp "weight" value
    city <- readProp "city" value
    university <- readProp "university" value
    teamId <- prop "team" value >>= readProp "id"
    teamName <- prop "team" value >>= readProp "name"
    pure $ Player
      { id
      , name
      , birthdate
      , position
      , height
      , weight
      , city
      , university
      , team: { id: teamId, name: teamName }
      }
