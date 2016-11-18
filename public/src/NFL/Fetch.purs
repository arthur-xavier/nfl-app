module NFL.Fetch where

import Prelude
import Network.HTTP.Affjax as Affjax
import Network.HTTP.Affjax (Affjax)
import Network.HTTP.Affjax.Response (class Respondable)

type Fetch = forall eff a. Respondable a => String -> Affjax eff a

fetch :: String -> Fetch
fetch baseUri url = Affjax.get (baseUri <> url)
