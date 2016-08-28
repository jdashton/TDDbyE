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


plus : Money -> Money -> Sum
plus augend addend =
  Sum augend addend


currency : Money -> String
currency money =
  let
    (Money _ currency) = money
  in
    currency


type alias Sum =
  { augend : Money
  , addend : Money
  }


reduce : Expression -> String -> Money
reduce exp to =
  case exp of
    SumExp sum -> reduceSum sum to
    MoneyExp money -> money


reduceSum : Sum -> String -> Money
reduceSum sum to =
  let
    (Money amt1 cur1) = sum.augend
    (Money amt2 cur2) = sum.addend
    amount = amt1 + amt2
  in
    Money amount to


type Expression
  = MoneyExp Money
  | SumExp Sum