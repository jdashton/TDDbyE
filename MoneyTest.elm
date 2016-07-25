module MoneyTest  exposing (..)

import ElmTest exposing (..)
import Dollar exposing (..)



tests : Test
tests =
    suite "Suite of Money tests"
        [ test "Multiplication"
            <| assertEqual 10 (Dollar.init 5 |> times 2 |> amount)
        ]


main : Program Never
main =
  runSuiteHtml tests
