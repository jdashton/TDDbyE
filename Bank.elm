module Bank exposing (..)


--import Money exposing (Money)
import Dict exposing (..)


rates = Dict.empty


--reduce : Expression -> String -> Money
--reduce source to =
--  Money.reduce source to


rate : String -> String -> Int
rate from to =
  if from == "CHF" && to == "USD" then 2 else 1