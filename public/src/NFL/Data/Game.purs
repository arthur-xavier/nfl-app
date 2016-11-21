module NFL.Data.Game where

import Prelude
import Data.Foreign.Class (class IsForeign, readProp)
import Data.Foreign.Index (prop)
import Data.Foreign.NullOrUndefined (unNullOrUndefined)
import Data.Maybe (fromMaybe)
import NFL.Data.Team (Team)

newtype Game = Game
  { id :: String
  , season :: { year :: Int, type_ :: String }
  , startTime :: String
  , home :: { team :: Team, score :: Int }
  , away :: { team :: Team, score :: Int }
  }

instance showGame :: Show Game where
  show (Game {id, season, startTime, home, away}) =
    "(Game " <> show id <> " s" <> show season.year <> " " <> startTime <>
    " {" <> show home.team <> show home.score <>
    ":" <> show away.score <> " " <> show away.team <> "})"

instance gameIsForeign :: IsForeign Game where
  read value = do
    id <- readProp "id" value
    year <- prop "season" value >>= readProp "year"
    type_ <- prop "season" value >>= readProp "type"
    startTime <- readProp "startTime" value
    homeTeam <- prop "home" value >>= readProp "team"
    homeScore <- zeroIfNothing <$> (prop "home" value >>= readProp "score")
    awayTeam <- prop "away" value >>= readProp "team"
    awayScore <- zeroIfNothing <$> (prop "away" value >>= readProp "score")
    pure $ Game
      { id
      , season: { year, type_ }
      , startTime
      , home: { team: homeTeam, score: homeScore }
      , away: { team: awayTeam, score: awayScore }
      }
    where
      zeroIfNothing = fromMaybe 0 <<< unNullOrUndefined
