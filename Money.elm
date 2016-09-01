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


dollar : Int -> Expression
dollar amount =
  MoneyExp <| Money amount "USD"


franc : Int -> Expression
franc amount =
  MoneyExp <| Money amount "CHF"


sum : Expression -> Expression -> Expression
sum augend addend =
  SumExp <| Sum augend addend


times : Expression -> Int -> Expression
times exp multiplier =
  case exp of
    MoneyExp money ->
      let
        (Money amount currency) = money
      in
        MoneyExp <| Money (amount * multiplier) currency

    SumExp sum   ->
      SumExp <| Sum (sum.augend `times` multiplier) (sum.addend `times` multiplier)


plus : Expression -> Expression -> Expression
plus augend addend =
  SumExp <| Sum augend addend


currency : Money -> String
currency money =
      let (Money _ currency) = money
      in currency


extract_money : Expression -> Money
extract_money exp =
  case exp of
    MoneyExp money -> money

    SumExp _ -> extract_money <| reduce exp empty_rates "USD"


extract_sum : Expression -> Sum
extract_sum exp =
  case exp of
    SumExp sum -> sum

    MoneyExp money -> Sum exp (dollar 0)


reduce : Expression -> Rates -> String -> Expression
reduce exp rates to =
  case exp of
    SumExp sum ->
      let
        (Money amt1 cur1) = extract_money <| reduce sum.augend rates to
        (Money amt2 cur2) = extract_money <| reduce sum.addend rates to
        amount = amt1 + amt2
      in
        MoneyExp <| Money amount to

    MoneyExp money ->
      let
        (Money amount currency) = money
        rate = Bank.rate rates currency to
      in
        MoneyExp <| Money (amount // rate) to
