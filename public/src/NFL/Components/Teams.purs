module NFL.Components.Teams where

import Prelude
import Pux.Html as H
import Pux.Html.Attributes as A
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import NFL.Data.Team (Team(..))
import Pux.Html (Html)

view :: forall a. Maybe (Array Team) -> Html a
view Nothing = H.article [] []
view (Just teams) =
  H.article
    [ A.className "layout-column"
    , A.style
      [ Tuple "width" "100%"
      , Tuple "alignItems" "stretch"
      ]
    ]
    [ H.h2 [] [ H.text "Teams" ]
    , H.div [ A.style [ Tuple "width" "100%" ] ]
      (teamCard <$> teams)
    ]

teamCard :: forall a. Team -> Html a
teamCard team@(Team t) =
  H.div
    [ A.className "card layout-row"
    , A.style
      [ Tuple "margin" "1.8rem 0"
      ]
    ]
    [ H.div [ A.className "card-content layout-row layout-align-start-center flex" ]
      [ teamPicture team
      , H.div
        [ A.className "layout-column flex"
        , A.style
          [ Tuple "marginLeft" "1.2rem"
          ]
        ]
        [ H.h4 [] [ H.text $ t.city <> " " <> t.name ]
        ]
      , H.div
        [ A.className "layout-column layout-align-end-end"
        , A.style [ Tuple "alignSelf" "stretch" ]
        ]
        [ H.a
          [ A.href $ "http://www.nfl.com/teams/profile?team=" <> t.id
          , A.target "_blank"
          ]
          [ H.text "more..." ]
        ]
      ]
    ]

teamPicture :: forall a. Team -> Html a
teamPicture (Team {id}) =
  H.div
    [ A.style
      [ Tuple "height" "90px"
      , Tuple "borderRadius" "2px"
      ]
    ]
    [ H.img
      [ A.src ("/teams/" <> id <> ".gif")
      , A.style
        [ Tuple "height" "90px"
        ]
      ]
      []
    ]
