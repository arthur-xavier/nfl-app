module NFL.Components.Players where

import Prelude
import Pux.Html as H
import Pux.Html.Attributes as A
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import NFL.Data.Player (Player(..))
import Pux.Html (Html)
import Pux.Router (link)

foreign import showDate :: String -> String

view :: forall a. Maybe (Array Player) -> Html a
view Nothing = H.article [] []
view (Just players) =
  H.article
    [ A.className "layout-column"
    , A.style
      [ Tuple "width" "100%"
      , Tuple "alignItems" "stretch"
      ]
    ]
    [ H.h2 [] [ H.text "Players" ]
    , H.div [ A.style [ Tuple "width" "100%" ] ]
      (playerCard <$> players)
    ]

playerCard :: forall a. Player -> Html a
playerCard player@(Player p) =
  H.div
    [ A.className "card layout-row"
    , A.style
      [ Tuple "margin" "1.2rem 0"
      ]
    ]
    [ H.div [ A.className "card-content layout-row layout-align-start-center flex" ]
      [ playerPicture player
      , H.div
        [ A.className "layout-column flex"
        , A.style
          [ Tuple "marginLeft" "1.2rem"
          ]
        ]
        [ H.h4 [] [ H.text p.name ]
        , H.small [] [ H.text $ show feet <> "'" <> show inches <> "\", " <> show p.weight <> " lb" ]
        , H.p [] [ H.text p.university ]
        , H.small [] [ H.text $ "Born in " <> p.city <> " at the " <> showDate p.birthdate <> "." ]
        , H.p [] [ H.strong [] [ H.text "Position: " ], H.span [] [ H.text p.position ] ]
        , H.p [] [ H.strong [] [ H.text "Team: " ], link ("/teams/" <> show p.team.id) [] [ H.text p.team.name ] ]
        ]
      , H.div
        [ A.className "layout-column layout-align-end-end"
        , A.style [ Tuple "alignSelf" "stretch" ]
        ]
        [ link ("/players/" <> show p.id) [] [ H.text "more..." ]
        ]
      ]
    ]
  where
    feet = p.height `div` 12
    inches = p.height `mod` 12

playerPicture :: forall a. Player -> Html a
playerPicture (Player {id}) =
  H.div
    [ A.style
      [ Tuple "backgroundColor" "#E4E5E7"
      , Tuple "height" "144px"
      , Tuple "borderRadius" "2px"
      ]
    ]
    [ H.img
      [ A.src ("/players/" <> show id <> ".png")
      , A.style
        [ Tuple "height" "144px"
        ]
      ]
      []
    ]
