module Money exposing (..)


import Bank exposing (..)


type Money
  = Money Int String


type alias Sum =
  { augend : Expression
  , addend : Expression
  }


type Expression
  = MoneyExp Money
  | SumExp Sum


dollar : Int -> Money
dollar amount =
  Money amount "USD"


franc : Int -> Money
franc amount =
  Money amount "CHF"


times : Money -> Int -> Expression
times money multiplier =
  let
    (Money amount currency) = money
  in
    MoneyExp <| Money (amount * multiplier) currency


plus : Expression -> Expression -> Sum
plus augend addend =
  Sum augend addend


currency : Money -> String
currency money =
  let
    (Money _ currency) = money
  in
    currency


reduce : Expression -> Rates -> String -> Money
reduce exp rates to =
  case exp of
    SumExp sum ->
      let
        (Money amt1 cur1) = reduce sum.augend rates to
        (Money amt2 cur2) = reduce sum.addend rates to
        amount = amt1 + amt2
      in
        Money amount to

    MoneyExp money ->
      let
        (Money amount currency) = money
        rate = Bank.rate rates currency to
      in
        Money (amount // rate) to
