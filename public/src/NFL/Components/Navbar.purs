module NFL.Components.Navbar
  ( navbar
  ) where

import Prelude
import Pux.Html as H
import Pux.Html.Attributes as A
import Data.Tuple (Tuple(..))
import Pux.Html (Html, Attribute)
import Pux.Router (link)

navbar :: forall a. Array (Html a) -> Html a
navbar children =
  H.nav [ A.className "navbar" ]
    [ H.div [ A.className "navbar-inner" ]
      [ container $
        [ logo "/logo.png"
        , H.h1 [flex] [H.text "National Football League"]
        ]
        <> children
      ]
    ]

container :: forall a. Array (Html a) -> Html a
container children =
  H.div
    [ A.className "container layout-row layout-align-start-center flex"
    ]
    children

logo :: forall a. String -> Html a
logo src =
  link "/" []
    [ H.img
      [ A.src src
      , A.style
        [ Tuple "marginTop" "-72px"
        , Tuple "marginRight" "24px"
        ]
      ]
      []
    ]

flex :: forall a. Attribute a
flex = A.className "flex"
