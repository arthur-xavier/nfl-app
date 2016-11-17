module NFL.Routes where

import Prelude
import Control.Alternative ((<|>))
import Data.Maybe (fromMaybe)
import Pux.Router (end, int, lit, router, str)

data Route
  = Home
  | Games
  | Game Int
  | Teams
  | Team Int
  | Players
  | Player Int
  | Search String

match :: String -> Route
match url = fromMaybe Home $ router url $
  Home <$ end
  <|>
  Games <$ (lit "games") <* end
  <|>
  Game <$> (lit "games" *> int) <* end
  <|>
  Teams <$ (lit "teams") <* end
  <|>
  Team <$> (lit "teams" *> int) <* end
  <|>
  Players <$ (lit "players") <* end
  <|>
  Player <$> (lit "players" *> int) <* end
  <|>
  Search <$> (lit "search" *> str) <* end
