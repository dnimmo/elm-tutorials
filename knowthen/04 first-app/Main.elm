module Main exposing (..)

import String
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App


type alias Model =
    { calories : Int
    , input : Int
    , error : Maybe String
    }


initModel : Model
initModel =
    { calories = 0
    , input = 0
    , error = Nothing
    }


type Msg
    = Input String
    | AddCalories
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        Input val ->
            case String.toInt val of
                Ok input ->
                    { model
                        | input = input
                        , error = Nothing
                    }

                Err err ->
                    { model
                        | input = 0
                        , error = Just err
                    }

        AddCalories ->
            { model
                | calories = model.calories + model.input
                , input = 0
            }

        Clear ->
            initModel


view : Model -> Html Msg
view model =
    div []
        [ h3 []
            [ text ("Calorie Counter: " ++ (toString model.calories)) ]
        , input
            [ type' "text"
            , placeholder "Enter calories"
            , onInput Input
            , value
                (if model.input == 0 then
                    ""
                 else
                    toString model.input
                )
            ]
            []
        , div [] [ text (Maybe.withDefault "" model.error) ]
        , button
            [ type' "button"
            , onClick AddCalories
            ]
            [ text "Add" ]
        , button
            [ type' "button"
            , onClick Clear
            ]
            [ text "Clear" ]
        ]


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
