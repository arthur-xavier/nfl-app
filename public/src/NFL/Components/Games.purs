module NFL.Components.Games where

import Prelude
import Pux.Html as H
import Pux.Html.Attributes as A
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import NFL.Data.Game (Game(..))
import NFL.Data.Team (Team(..))
import Pux.Html (Html)

foreign import showGameDate :: String -> String

view :: forall a. Maybe (Array Game) -> Html a
view Nothing = H.article [] []
view (Just games) =
  H.article
    [ A.className "layout-column"
    , A.style
      [ Tuple "width" "100%"
      , Tuple "alignItems" "stretch"
      ]
    ]
    [ H.h2 [] [ H.text "Games" ]
    , H.div [ A.style [ Tuple "width" "100%" ] ]
      (gameCard <$> games)
    ]

gameCard :: forall a. Game -> Html a
gameCard (Game g) =
  H.div
    [ A.className "card layout-row"
    , A.style
      [ Tuple "margin" "1.8rem 0"
      ]
    ]
    [ H.div [ A.className "card-content layout-row layout-align-start-center flex" ]
      [ H.div
        [ A.className "layout-column flex"
        ]
        [ H.h4 [] [ H.text $ homeName <> " " <> show g.home.score <> ":" <> show g.away.score <> " " <> awayName ]
        , H.small [] [ H.text $ showGameDate g.startTime ]
        , H.p [] [ H.text $ g.season.type_ <> " " <> show g.season.year ]
        ]
      ]
    ]
  where
    homeName = homeTeam.city <> " " <> homeTeam.name
    awayName = awayTeam.city <> " " <> awayTeam.name
    homeTeam = getTeam g.home.team
    awayTeam = getTeam g.away.team
    getTeam (Team t) = t
