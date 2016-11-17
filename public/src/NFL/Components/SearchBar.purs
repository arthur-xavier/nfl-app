module NFL.Components.SearchBar
  ( view
  , update
  , Action(..)
  , State
  ) where

import Pux.Html as H
import Pux.Html.Attributes as A
import Pux.Html.Events as E
import Data.Tuple (Tuple(..))
import Pux.Html (Html)

data Action
  = Search String

type State = String

update :: Action -> State -> State
update action state =
  case action of
    Search search ->
      search

view :: String -> Html Action
view color =
  H.div
    [ A.className "searchBar"
    , A.style
      [ Tuple "position" "relative"
      ]
    ]
    [ H.input
      [ A.className "searchBar"
      , E.onKey "enter" (\e -> Search e.target.value)
      , A.placeholder "Search..."
      , A.style
        [ Tuple "background" "none"
        , Tuple "color" color
        , Tuple "border" "none"
        , Tuple "borderBottom" "1px #000 solid"
        , Tuple "borderBottomColor" color
        , Tuple "padding" "2px"
        , Tuple "paddingLeft" "32px"
        ]
      ]
      []
    , H.img
      [ A.src "/icon-search-white.png"
      , A.style
        [ Tuple "position" "absolute"
        , Tuple "left" "0"
        , Tuple "bottom" "0"
        , Tuple "width" "24px"
        , Tuple "height" "24px"
        ]
      ]
      []
    ]
