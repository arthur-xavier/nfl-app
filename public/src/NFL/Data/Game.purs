module NFL.Data.Game where

import Prelude
import Data.Foreign.Class (class IsForeign, readProp)
import NFL.Data.Stadium (Stadium)
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

instance showGame :: Show Game where
  show (Game {id, season, type_, date, stadium, home, away}) =
    "(Game " <> show id <> " s" <> season <> " " <> type_ <> " " <> date <>
    " " <> show stadium <> " {" <> show home.team <> ":" <> show away.team <>
    "} " <> show home.score <> ":" <> show away.score <> ")"

instance gameIsForeign :: IsForeign Game where
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
