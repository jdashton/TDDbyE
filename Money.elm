module Money exposing (..)


import Sum exposing (..)


type Money
  = Money Int String


dollar : Int -> Money
dollar amount =
  Money amount "USD"


franc : Int -> Money
franc amount =
  Money amount "CHF"


times : Int -> Money -> Money
times multiplier money =
  let
    (Money amount currency) = money
  in
    Money (amount * multiplier) currency


plus : Money -> Money -> Sum Money
plus augend addend =
  Sum augend addend


currency : Money -> String
currency money =
  let
    (Money _ currency) = money
  in
    currency
