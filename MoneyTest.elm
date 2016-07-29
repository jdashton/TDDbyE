module MoneyTest  exposing (..)

import ElmTest exposing (..)
import Dollar exposing (..)



tests : Test
tests =
  let
      five =
        Dollar 5
  in
    suite "Suite of Money tests"
        [ test "Multiplication10" <| assertEqual (Dollar 10) (five |> times 2)
        , test "Multiplication15" <| assertEqual (Dollar 15) (five |> times 3)
        , test "Equality"         <| assert <| Dollar 5 == Dollar 5
        , test "Inequality"       <| assert <| Dollar 5 /= Dollar 6
        ]


main : Program Never
main =
  runSuiteHtml tests
