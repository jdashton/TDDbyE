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
        [ test "Multiplication"
            <| assertEqual 10 (times 2 five |> amount)
        , test "Mult2"
            <| assertEqual 15 (times 3 five |> amount)
        ]


main : Program Never
main =
  runSuiteHtml tests
