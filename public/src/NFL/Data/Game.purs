module NFL.Data.Game where

import Prelude
import Data.Foreign.Class (class IsForeign, readProp)
import Data.Foreign.Index (prop)
import NFL.Data.Team (Team)

type GameSide =
  { team :: Team
  , score :: Int
  }

newtype Game = Game
  { id :: Int
  , season :: String
  , type_ :: String
  , attendance :: Int
  , date :: String
  , stadium :: Stadium
  , home :: GameSide
  , away :: GameSide
  }

instance playerIsForeign :: IsForeign Game where
  read value = do
    id <- readProp "id" value
    season <- readProp "season" value
    type_ <- readProp "type" value
    attendance <- readProp "attendance" value
    date <- readProp "date" value
    homeTeam <- readProp "hometeam" value
    homeScore <- readProp "homescore" value
    awayTeam <- readProp "awayteam" value
    awayScore <- readProp "awayscore" value
    stadium <- readProp "stadium" value
    pure $ Game
      { id
      , season
      , type_
      , attendance
      , date
      , stadium
      , home: { team: homeTeam, score: homeScore }
      , away: { team: awayTeam, score: awayScore }
      }

newtype Stadium = Stadium
  { id :: Int
  , name :: String
  , capacity :: Int
  , city :: String
  }

instance stadiumIsForeign :: IsForeign Stadium where
  read value = do
    id <- readProp "id" value
    name <- readProp "name" value
    capacity <- readProp "capacity" value
    city <- prop "city" value >>= readProp "name"
    pure $ Stadium { id, name, capacity, city }
