module Main exposing (..)

import Html exposing (Html, div)
import Model exposing (Msg, Model, model, update)
import Attributes


view : Model -> Html Msg
view model =
    div []
        [ Attributes.view model
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }
