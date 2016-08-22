module Money exposing (..)


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


plus : Money -> Money -> Money
plus money addend =
  let
    (Money amount currency) = money
    (Money add_amt _) = addend
  in
    Money (amount + add_amt) currency


currency : Money -> String
currency money =
  let
    (Money _ currency) = money
  in
    currency
