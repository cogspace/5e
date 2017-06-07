module Main exposing (..)

import Html exposing (Html, div)
import Model exposing (Msg, Model, model, update)
import Abilities


view : Model -> Html Msg
view model =
    Abilities.view model


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
