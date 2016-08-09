module Dollar exposing (..)



type alias Dollar =
  { amount : Int }


times : Int -> Dollar -> Dollar
times multiplier dol =
  { dol | amount = dol.amount * multiplier }
