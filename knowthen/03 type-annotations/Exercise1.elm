module Main exposing (..)

import Html


cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 10, freeQty = 0 }
    ]


calculateFreeItems minimumQuantity freeAmount item =
    if item.freeQty == 0 && item.qty >= minimumQuantity then
        { item
            | freeQty = freeAmount
        }
    else
        item


main =
    List.map ((calculateFreeItems 10 3) >> (calculateFreeItems 5 1)) cart
        |> toString
        |> Html.text
