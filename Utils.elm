module Utils exposing (..)

import Html exposing (Html, Attribute, input)
import Html.Attributes exposing (type_)


parseInt : String -> Int
parseInt str =
    String.toInt str
        |> Result.toMaybe
        |> Maybe.withDefault 0


toModString : Int -> String
toModString int =
    if int >= 0 then
        "+" ++ toString int
    else
        toString int


checkbox : List (Attribute msg) -> List (Html msg) -> Html msg
checkbox attrs children =
    input
        ((type_ "checkbox") :: attrs)
        children
