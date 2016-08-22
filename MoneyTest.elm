module MoneyTest  exposing (..)

import ElmTest exposing (..)
import Money exposing (..)
import Bank exposing (..)


tests : Test
tests =
  let
      five_usd = dollar 5
      five_chf = franc 5
      sum      = five_usd `plus` five_usd
      reduced  = Bank.reduce sum "USD"
  in
    suite "Suite of Money tests"
        [ test "Multiplication10"       <| assertEqual (dollar 10) (five_usd |> times 2)
        , test "Multiplication15"       <| assertEqual (dollar 15) (five_usd |> times 3)
        , test "Equality"               <| assert <| dollar 5 == dollar 5
        , test "Inequality"             <| assert <| dollar 5 /= dollar 6
        , test "Inequality CHF to USD"  <| assert <| franc 5 /= dollar 5
        , test "Currency USD"           <| assertEqual "USD" (dollar 1 |> currency)
        , test "Currency CHF"           <| assertEqual "CHF" (franc 1 |> currency)
        , test "Simple Addition"        <| assertEqual (dollar 10) reduced
        ]


main : Program Never
main =
  runSuiteHtml tests
