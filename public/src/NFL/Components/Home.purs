module NFL.Components.Home where

import Prelude
import Pux.Html as H
import Pux.Html.Attributes as A
import Data.String (toLower)
import Data.Tuple (Tuple(..))
import Pux.Html (Html)
import Pux.Router (link)

view :: forall a. Html a
view =
  H.article
    [ A.className "layout-row"
    , A.style
      [ Tuple "justifyContent" "space-around"
      , Tuple "alignItems" "center"
      , Tuple "flexWrap" "wrap"
      ]
    ]
    [ card "Games"
    , card "Teams"
    , card "Players"
    ]

card :: forall a. String -> Html a
card title =
  link ("/" <> toLower title)
    [ A.className "card layout-row layout-align-end-center"
    , A.style
      [ Tuple "backgroundColor" "#000000"
      , Tuple "margin" "1.2rem"
      , Tuple "width" "268px"
      , Tuple "height" "192px"
      ]
    ]
    [ H.img
      [ A.className "card-background"
      , A.src ("/" <> toLower title <> ".png")
      ]
      []
    , H.div [ A.className "card-title" ] [ H.h3 [] [H.text title] ]
    ]
