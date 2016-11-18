module Data.Result where

import Prelude
import Control.Alt (class Alt)
import Data.Bifunctor (class Bifunctor)

data Result e a
  = Loading
  | Fail e
  | Done a

derive instance eqResult :: (Eq e, Eq a) => Eq (Result e a)
derive instance ordResult :: (Ord e, Ord a) => Ord (Result e a)

instance showResult :: (Show e, Show a) => Show (Result e a) where
  show Loading = "Loading"
  show (Fail e) = "(Fail " <> show e <> ")"
  show (Done a) = "(Done " <> show a <> ")"

instance functorResult :: Functor (Result e) where
  map f (Done a) = Done (f a)
  map _ (Fail e) = Fail e
  map _ Loading  = Loading

instance bifunctorResult :: Bifunctor Result where
  bimap f _ (Fail e) = Fail (f e)
  bimap _ g (Done a) = Done (g a)
  bimap _ _ Loading  = Loading

instance applyResult :: Apply (Result e) where
  apply (Done f) r = f <$> r
  apply (Fail e) _ = Fail e
  apply Loading (Done a) = Loading
  apply Loading (Fail e) = Fail e
  apply Loading _ = Loading

instance applicativeResult :: Applicative (Result e) where
  pure = Done

instance altResult :: Alt (Result e) where
  alt (Fail _) r = r
  alt (Done d) _ = Done d
  alt Loading  _ = Loading

instance bindResult :: Bind (Result e) where
  bind Loading  _ = Loading
  bind (Fail e) _ = Fail e
  bind (Done a) f = f a

instance monadResult :: Monad (Result e)

instance boundedResult :: (Bounded e, Bounded a) => Bounded (Result e a) where
  top = Done top
  bottom = Fail bottom
