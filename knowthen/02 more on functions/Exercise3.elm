module Main exposing (..)

import Html
import String

wordCount : String -> Int
wordCount =
  String.words >> List.length

main =
  "Count the number of words in this sentence"
    |> wordCount
    |> toString
    |> Html.text
