module Money exposing (..)


type Money
  = Dollar Int
  | Franc Int


times : Int -> Money -> Money
times multiplier money =
  case money of
    Dollar amount ->
      Dollar <| amount * multiplier

    Franc amount ->
      Franc <| amount * multiplier


currency : Money -> String
currency money =
  case money of
    Dollar _ ->
      "USD"

    Franc _ ->
      "CHF"
