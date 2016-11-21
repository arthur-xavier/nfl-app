module NFL.Data.Player where

import Prelude
import Data.Foreign.Class (class IsForeign, readProp)
import NFL.Data.Team (Team)

newtype Player = Player
  { id :: String
  , name :: String
  , number :: Int
  , birthdate :: String
  , position :: String
  , height :: Int
  , weight :: Int
  , college :: String
  , team :: Team
  , profile :: String
  }

instance showPlayer :: Show Player where
  show (Player {id, name, number, position, college}) =
    "(Player " <> show id <> " " <> name <> " " <> show number <> ", " <>
    position <> ", " <> college <> ")"

instance playerIsForeign :: IsForeign Player where
  read value = do
    id <- readProp "id" value
    name <- readProp "name" value
    number <- readProp "number" value
    birthdate <- readProp "birthdate" value
    position <- readProp "position" value
    height <- readProp "height" value
    weight <- readProp "weight" value
    college <- readProp "college" value
    team <- readProp "team" value
    profile <- readProp "profile" value
    pure $ Player
      { id
      , name
      , number
      , birthdate
      , position
      , height
      , weight
      , college
      , team
      , profile
      }
