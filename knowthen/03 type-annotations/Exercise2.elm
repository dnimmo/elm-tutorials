module Main exposing (..)

import Html

type alias Item =
  { name : String
  , qty : Int
  , freeQty : Int
  }

cart : List Item
cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 10, freeQty = 0 }
    ]

calculateFreeItems : Int -> Int -> Item -> Item
calculateFreeItems minimumQuantity freeAmount item =
  if item.freeQty == 0 && item.qty >= minimumQuantity then
    { item
        | freeQty = freeAmount
    }
  else
    item

main : Html.Html msg
main =
  List.map ((calculateFreeItems 10 3) >> (calculateFreeItems 5 1)) cart
    |> toString
    |> Html.text
