module Abilities exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Model, Msg(..))


type alias Style =
    List ( String, String )


mod : Int -> Int
mod attr =
    attr // 2 - 5


mainStyle : Style
mainStyle =
    [ ( "display", "inline-block" )
    , ( "background-color", "#ddd" )
    , ( "border-radius", "8px" )
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


toPosString : Int -> String
toPosString int =
    if int >= 0 then
        "+" ++ toString int
    else
        toString int


view : Model -> Html Msg
view model =
    div [ style mainStyle ]
        [ viewAbility "STRENGTH" model.str ChangeStr
        , viewAbility "DEXTERITY" model.dex ChangeDex
        , viewAbility "CONSTITUTION" model.con ChangeCon
        , viewAbility "INTELLIGENCE" model.int ChangeInt
        , viewAbility "WISDOM" model.wis ChangeWis
        , viewAbility "CHARISMA" model.cha ChangeCha
        ]


viewAbility : String -> Int -> (String -> Msg) -> Html Msg
viewAbility label attr msg =
    div
        [ style abilityStyle ]
        [ div
            [ style abilityNameStyle ]
            [ text label
            ]
        , div
            [ style abilityModStyle ]
            [ text <| toPosString <| mod attr
            ]
        , input
            [ type_ "number"
            , style abilityScoreStyle
            , value <| toString attr
            , onInput msg
            ]
            []
        ]
