module View.Abilities exposing (view)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (value, style, type_)
import Html.Events exposing (onInput)
import Model.Main exposing (Model, Msg(..))
import Model.Abilities as Abilities exposing (AbilityScores, Ability(..))
import Style exposing (Style)
import Utils exposing (toModString, parseInt)


mainStyle : Style
mainStyle =
    [ ( "display", "inline-block" )
    , ( "background-color", "#ccc" )
    , ( "padding-top", "6px" )
    , ( "padding-bottom", "6px" )
    , ( "border-radius", "8px" )
    , ( "border", "4px double white" )
    , ( "margin", "5px" )
    ]


abilityStyle : Style
abilityStyle =
    [ ( "border", "2px solid black" )
    , ( "position", "relative" )
    , ( "width", "80px" )
    , ( "height", "80px" )
    , ( "text-align", "center" )
    , ( "margin", "10px" )
    , ( "background-color", "white" )
    , ( "font-family", "sans-serif" )
    , ( "border-radius", "4px" )
    , ( "margin-bottom", "25px" )
    ]


abilityModStyle : Style
abilityModStyle =
    [ ( "font-size", "32px" )
    , ( "line-height", "50px" )
    ]


abilityNameStyle : Style
abilityNameStyle =
    [ ( "font-size", "10px" )
    , ( "margin-top", "4px" )
    ]


abilityScoreStyle : Style
abilityScoreStyle =
    [ ( "display", "block" )
    , ( "position", "absolute" )
    , ( "bottom", "-14px" )
    , ( "left", "18px" )
    , ( "width", "30px" )
    , ( "padding-left", "10px" )
    , ( "height", "20px" )
    , ( "border-radius", "15px" )
    , ( "border", "2px solid black" )
    ]


viewAbility : AbilityScores -> Ability -> Html Msg
viewAbility model ability =
    let
        name =
            Abilities.name ability

        score =
            model |> Abilities.get ability

        modifier =
            Abilities.modifier model ability
    in
        div
            [ style abilityStyle ]
            [ div
                [ style abilityNameStyle ]
                [ text (String.toUpper name)
                ]
            , div
                [ style abilityModStyle ]
                [ text (toModString modifier)
                ]
            , input
                [ type_ "number"
                , style abilityScoreStyle
                , value (toString score)
                , onInput (parseInt >> ChangeAbility ability)
                ]
                []
            ]


view : AbilityScores -> Html Msg
view abilities =
    div [ style mainStyle ]
        (Abilities.map <| viewAbility abilities)
