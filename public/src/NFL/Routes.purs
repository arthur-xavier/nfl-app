module NFL.Routes where

import Prelude
import Control.Alternative ((<|>))
import Data.Maybe (Maybe(..), fromMaybe)
import NFL.Data.Game (Game)
import NFL.Data.Player (Player)
import NFL.Data.Team (Team)
import Pux.Router (end, int, lit, router, str)

data Route
  = Home
  | Games (Maybe (Array Game))
  | Game (Maybe Game) Int
  | Teams (Maybe (Array Team))
  | Team (Maybe Team) Int
  | Players (Maybe (Array Player))
  | Player (Maybe Player) Int
  | Search String

match :: String -> Route
match url = fromMaybe Home $ router url $
  Home <$ end
  <|>
  Games Nothing <$ (lit "games") <* end
  <|>
  Game Nothing <$> (lit "games" *> int) <* end
  <|>
  Teams Nothing <$ (lit "teams") <* end
  <|>
  Team Nothing <$> (lit "teams" *> int) <* end
  <|>
  Players Nothing <$ (lit "players") <* end
  <|>
  Player Nothing <$> (lit "players" *> int) <* end
  <|>
  Search <$> (lit "search" *> str) <* end
