module MoneyTest  exposing (..)

import ElmTest exposing (..)
import Dollar exposing (..)



tests : Test
tests =
  let
      five =
        Dollar.init 5
  in
    suite "Suite of Money tests"
        [ test "Multiplication10" <| assertEqual 10 (times 2 five |> amount)
        , test "Multiplication15" <| assertEqual 15 (times 3 five |> amount)
        , test "Equality"         <| assert(Dollar.init(5) == Dollar.init(5))
        , test "Inequality"       <| assert(Dollar.init(5) /= Dollar.init(6))
        ]


main : Program Never
main =
  runSuiteHtml tests
