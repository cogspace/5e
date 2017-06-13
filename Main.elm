module Main exposing (..)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (style)
import Style exposing (Style)
import Profs
import Model.Main exposing (Msg(..), Model, model, update)
import View.Abilities
import View.ProfBonus
import View.SavingThrows
import View.Skills
import View.PassivePerception


columnStyle : Style
columnStyle =
    [ ( "display", "inline-block" )
    , ( "vertical-align", "top" )
    ]


view : Model -> Html Msg
view model =
    div [ style columnStyle ]
        [ div []
            [ div [ style columnStyle ]
                [ View.Abilities.view model.abilities ]
            , div [ style columnStyle ]
                [ View.ProfBonus.view model.profBonus
                , View.SavingThrows.view model
                , View.Skills.view model
                , View.PassivePerception.view model
                ]
            ]
        , div []
            [ Profs.view ProfsMsg model.profs
            ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
