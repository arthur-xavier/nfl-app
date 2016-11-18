module Main where

import Prelude
import NFL.Layout as Layout
import Control.Monad.Eff (Eff)
import DOM (DOM)
import NFL.Fetch (fetch)
import NFL.Layout (Action(PageView), State)
import NFL.Routes (match)
import Network.HTTP.Affjax (AJAX)
import Pux (App, Config, CoreEffects, renderToDOM, start)
import Pux.Devtool (Action, start) as Pux.Devtool
import Pux.Router (sampleUrl)
import Signal ((~>))

type AppEffects = (ajax :: AJAX, dom :: DOM)

_API_URI :: String
_API_URI = "http://localhost:8080"

config :: forall eff. State -> Eff (dom :: DOM | eff) (Config State Action AppEffects)
config state = do
  urlSignal <- sampleUrl
  let routeSignal = urlSignal ~> PageView <<< match
  pure
    { initialState: state
    , update: Layout.update $ fetch _API_URI
    , view: Layout.view
    , inputs: [routeSignal]
    }

main :: State -> Eff (CoreEffects AppEffects) (App State Action)
main state = do
  app <- start =<< config state
  renderToDOM "#app" app.html
  pure app

debug :: State -> Eff (CoreEffects AppEffects) (App State (Pux.Devtool.Action Action))
debug state = do
  app <- Pux.Devtool.start =<< config state
  renderToDOM "#app" app.html
  pure app
