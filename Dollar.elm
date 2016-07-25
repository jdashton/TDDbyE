module Dollar exposing (..)



type alias Dollar =
  { amnt : Int
  }


init : Int -> Dollar
init amt =
  { amnt = amt }


times : Int -> Dollar -> Dollar
times multiplier dol =
  { dol | amnt = dol.amnt * multiplier }


amount : Dollar -> Int
amount dol =
  dol.amnt
