module NFL.Layout where

import Prelude
import NFL.Components.Home as Home
import NFL.Components.Players as Players
import NFL.Components.SearchBar as SearchBar
import NFL.Routes as Routes
import Pux.Html as H
import Pux.Html.Attributes as A
import Control.Monad.Aff (Aff)
import Control.Monad.Except (runExcept)
import Data.Either (either)
import Data.Foreign (F)
import Data.Foreign.Class (class IsForeign, readJSON)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Debug.Trace (traceShow)
import NFL.Components.Navbar (navbar)
import NFL.Fetch (Fetch)
import NFL.Routes (Route)
import Network.HTTP.Affjax (AJAX)
import Pux (EffModel, noEffects)
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

update :: forall eff. Fetch -> Action -> State -> EffModel State Action (ajax :: AJAX | eff)
update fetch action state =
  case action of
    PageView (Routes.Games Nothing) ->
      { state: state { route = Routes.Games Nothing }
      , effects: [fetchResource "/games" Routes.Games]
      }

    PageView (Routes.Teams Nothing) ->
      { state: state { route = Routes.Teams Nothing }
      , effects: [fetchResource "/teams" Routes.Teams]
      }

    PageView (Routes.Players Nothing) ->
      { state: state { route = Routes.Players Nothing }
      , effects: [fetchResource "/players" Routes.Players]
      }

    PageView route ->
      noEffects $ state { route = route }

    SearchBar searchBarAction ->
      noEffects $ state { search = SearchBar.update searchBarAction state.search }

  where
    fetchResource :: forall a eff0. (Show a, IsForeign a) => String -> (Maybe a -> Route) -> Aff (ajax :: AJAX | eff0) Action
    fetchResource uri route = do
      { response } <- fetch uri
      let eitherM = runExcept $ readJSON response :: F a
      traceShow eitherM \_ -> pure unit
      pure $ PageView $ either (const $ Routes.Home) (route <<< Just) eitherM

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
          Routes.Players players -> Players.view players
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
