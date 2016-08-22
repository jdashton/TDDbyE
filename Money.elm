module Money exposing (..)


type Money
  = Dollar Int String
  | Franc Int String


dollar : Int -> Money
dollar amount =
  Dollar amount "USD"


franc : Int -> Money
franc amount =
  Franc amount "CHF"


times : Int -> Money -> Money
times multiplier money =
  case money of
    Dollar amount currency ->
      dollar <| amount * multiplier

    Franc amount currency ->
      franc <| amount * multiplier


currency : Money -> String
currency money =
  case money of
    Dollar _ currency -> currency
    Franc  _ currency -> currency
