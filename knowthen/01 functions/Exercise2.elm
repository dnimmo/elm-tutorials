module Main exposing (..)

import String
import Html


uppercase : Int -> String -> String
uppercase maxLength text =
    if String.length text > maxLength then
        String.toUpper text
    else
        text


main =
    let
        text =
            "David Nimmo"

        length =
            String.length text
    in
        (uppercase 10 text)
            ++ " - name length: "
            ++ (toString length)
            |> Html.text
