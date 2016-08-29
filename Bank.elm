module Bank exposing (..)


--import Money exposing (Money)
import Dict exposing (..)


empty_rates = Dict.empty


type alias Rates = Dict (String, String) Int


--reduce : Expression -> String -> Money
--reduce source to =
--  Money.reduce source to


rate : Rates -> String -> String -> Int
rate rates from to =
  case get (from, to) rates of
    Just rate -> rate
    Nothing -> if from == to then 1 else 0


addRate : Rates -> String -> String -> Int -> Rates
addRate rates from to rate =
  Dict.insert (from, to) rate rates
