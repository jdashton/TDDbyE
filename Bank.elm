module Bank exposing (..)


import Money exposing (..)


reduce : Expression -> String -> Money
reduce exp to =
  Money.reduce exp to
