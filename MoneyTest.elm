module MoneyTest  exposing (..)

import ElmTest exposing (..)
import Dollar exposing (..)
import Franc exposing (..)



tests : Test
tests =
  let
      five =
        Dollar 5
  in
    suite "Suite of Money tests"
        [ test "Multiplication10"       <| assertEqual (Dollar 10) (five |> Dollar.times 2)
        , test "Multiplication15"       <| assertEqual (Dollar 15) (five |> Dollar.times 3)
        , test "Multiplication10 Franc" <| assertEqual (Franc 10) (five |> Franc.times 2)
        , test "Multiplication15 Franc" <| assertEqual (Franc 15) (five |> Franc.times 3)
        , test "Equality"               <| assert <| Dollar 5 == Dollar 5
        , test "Inequality"             <| assert <| Dollar 5 /= Dollar 6
        ]


main : Program Never
main =
  runSuiteHtml tests
