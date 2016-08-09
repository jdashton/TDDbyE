module Franc exposing (..)



type alias Franc =
  { amount : Int }


times : Int -> Franc -> Franc
times multiplier dol =
  { dol | amount = dol.amount * multiplier }
