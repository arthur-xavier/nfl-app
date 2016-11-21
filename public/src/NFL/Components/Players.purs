module NFL.Components.Players where

import Prelude
import Pux.Html as H
import Pux.Html.Attributes as A
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import NFL.Data.Player (Player(..))
import NFL.Data.Team (Team(..))
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
      [ H.div
        [ A.className "layout-column flex"
        ]
        [ H.h4 [] [ H.text $ p.name <> " #" <> show p.number <> " " <> p.position ]
        , H.small [] [ H.text $ show feet <> "'" <> show inches <> "\", " <> show p.weight <> " lb" ]
        , H.p [] [ H.strong [] [ H.text "Team: " ], link ("/teams/" <> team.id) [] [ H.text $ team.city <> " " <> team.name ] ]
        , H.p [] [ H.strong [] [ H.text "College: " ], H.span [] [ H.text p.college ] ]
        , H.small [] [ H.text $ "Born " <> showDate p.birthdate <> "." ]
        ]
      , H.div
        [ A.className "layout-column layout-align-end-end"
        , A.style [ Tuple "alignSelf" "stretch" ]
        ]
        [ H.a [ A.href p.profile, A.target "_blank" ] [ H.text "more..." ]
        ]
      ]
    ]
  where
    team = getTeam player
    getTeam (Player {team: (Team t)}) = t
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
      [ A.src ("/players/" <> id <> ".png")
      , A.style
        [ Tuple "height" "144px"
        ]
      ]
      []
    ]
