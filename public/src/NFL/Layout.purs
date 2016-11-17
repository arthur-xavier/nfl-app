module NFL.Layout where

import Prelude
import NFL.Components.Home as Home
import NFL.Routes as Routes
import NFL.Components.SearchBar as SearchBar
import Pux.Html as H
import Pux.Html.Attributes as A

import Data.Tuple (Tuple(..))
import NFL.Components.Navbar (navbar)
import NFL.Routes (Route)
import Pux.Html (Html)

data Action
  = PageView Route
  | SearchBar SearchBar.Action

type State =
  { route :: Route
  , search :: String
  }

init :: State
init =
  { route: Routes.Home
  , search: ""
  }

update :: Action -> State -> State
update action state =
  case action of
    PageView route ->
      state { route = route }

    SearchBar searchBarAction ->
      state { search = SearchBar.update searchBarAction state.search }

view :: State -> Html Action
view state =
  H.section
    [ A.className "layout-column"
    , A.style
      [ Tuple "minHeight" "100vh"
      ]
    ]
    [ navbar
      [ map SearchBar $ SearchBar.view "#FFFFFF"
      ]
    , H.main
      [ A.className "container layout-column layout-align-start-center flex"
      , A.style
        [ Tuple "padding" "2.4rem 0"
        ]
      ]
      [ case state.route of
          Routes.Home -> Home.view
          _ -> Home.view
      ]
    , H.footer
      [ A.className "footer"
      ]
      [ H.div
        [ A.className "container layout-row layout-align-start-center"
        ]
        [ H.text nflTrademark ]
      ]
    ]

nflTrademark :: String
nflTrademark = """
  NFL and the NFL shield design are registered trademarks of the National
  Football League. The team names, logos and uniform designs are registered
  trademarks of the teams indicated. All other NFL-related trademarks are
  trademarks of the National Football League.
  """
