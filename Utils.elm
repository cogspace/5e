module Utils exposing (..)

import Char


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


toTitle : String -> String
toTitle string =
    case String.uncons string of
        Just ( first, rest ) ->
            String.cons (Char.toUpper first) rest

        Nothing ->
            ""
