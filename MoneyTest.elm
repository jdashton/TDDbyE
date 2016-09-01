module MoneyTest  exposing (..)

import Expect
import Test exposing (..)
import Test.Runner.Html

import Money exposing (..)
import Bank exposing (..)


tests : Test
tests =
  let five = MoneyExp <| dollar 5
  in
    describe "Suite of Money tests"
      [ describe "Multiplication"
          [ test "times 2"              <| \() -> Expect.equal (MoneyExp <| dollar 10) (five `times` 2)
          , test "times 3"              <| \() -> Expect.equal (MoneyExp <| dollar 15) (five `times` 3)
          ]
      , test "Equality"               <| \() -> Expect.true  "$5 == $5"    <| dollar 5 == dollar 5
      , test "Inequality"             <| \() -> Expect.false "$5 != $6"    <| dollar 5 == dollar 6
      , test "Inequality CHF to USD"  <| \() -> Expect.false "$5 != 5 Fr." <|  franc 5 == dollar 5

      , test "Currency USD"           <| \() -> Expect.equal "USD" <| currency <| dollar 1
      , test "Currency CHF"           <| \() -> Expect.equal "CHF" <| currency <| franc 1

      , test "Simple Addition"        <| \() ->
          let
            five    = MoneyExp <| dollar 5
            sum     = five `plus` five
            reduced = reduce (SumExp sum) empty_rates "USD"
          in
            Expect.equal (dollar 10) reduced

      , let
          five    = MoneyExp <| dollar 5
          sum     = five `plus` five
        in describe "Plus Returns Sum"
          [ test "Plus Returns Sum: augend" <| \() -> Expect.equal five sum.augend
          , test "Plus Returns Sum: addend" <| \() -> Expect.equal five sum.addend
          ]
      , test "Reduce Sum"             <| \() ->
          let
            sum     = Sum (MoneyExp <| dollar 3) (MoneyExp <| dollar 4)
            result  = reduce (SumExp sum) empty_rates "USD"
          in
            Expect.equal (dollar 7) result

      , test "Reduce Money"           <| \() ->
          let
            result  = reduce (MoneyExp <| dollar 1) empty_rates "USD"
          in
            Expect.equal (dollar 1) result

      , test "Reduce Money Different Currency" <| \() ->
          let
            rates = addRate empty_rates "CHF" "USD" 2
            result  = reduce (MoneyExp <| franc 2) rates "USD"
          in
            Expect.equal (dollar 1) result

      , test "Identity Rate"                  <| \() ->
          Expect.equal 1 <| Bank.rate empty_rates "USD" "USD"

      , let
          fiveBucks = MoneyExp <| dollar 5
          tenFrancs = MoneyExp <| franc 10
          rates     = addRate empty_rates "CHF" "USD" 2
        in describe "Sum Operations"
          [ test "Mixed Addition"                 <| \() ->
              let result = reduce (SumExp (fiveBucks `plus` tenFrancs)) rates "USD"
              in Expect.equal (dollar 10) result
          , test "Sum Plus Money"                 <| \() ->
              let
                sum = SumExp <| (SumExp <| Sum fiveBucks tenFrancs) `plus` fiveBucks
                result = reduce sum rates "USD"
              in
                Expect.equal (dollar 15) result
          , test "Sum Times"                      <| \() ->
              let
                sum = (SumExp <| Sum fiveBucks tenFrancs) `times` 2
                result = reduce sum rates "USD"
              in
                Expect.equal (dollar 20) result
          ]

      ]


main : Program Never
main =
    [ tests
    ]
        |> concat
        |> Test.Runner.Html.run
