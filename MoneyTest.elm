module MoneyTest  exposing (..)

import ElmTest exposing (..)
import Money exposing (..)



tests : Test
tests =
  let
      five_usd = Dollar 5
      five_chf = Franc 5
  in
    suite "Suite of Money tests"
        [ test "Multiplication10"       <| assertEqual (Dollar 10) (five_usd |> times 2)
        , test "Multiplication15"       <| assertEqual (Dollar 15) (five_usd |> times 3)
        , test "Multiplication10 Franc" <| assertEqual (Franc 10) (five_chf |> times 2)
        , test "Multiplication15 Franc" <| assertEqual (Franc 15) (five_chf |> times 3)
        , test "Equality"               <| assert <| Dollar 5 == Dollar 5
        , test "Inequality"             <| assert <| Dollar 5 /= Dollar 6
        , test "Equality Franc"         <| assert <| Franc 5 == Franc 5
        , test "Inequality Franc"       <| assert <| Franc 5 /= Franc 6
        ]


main : Program Never
main =
  runSuiteHtml tests
