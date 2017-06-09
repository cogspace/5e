module View.ProfBonus exposing (view)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (type_, value, style)
import Html.Events exposing (onInput)
import Model.Main exposing (Model, Msg(..))
import Style exposing (Style)
import Utils exposing (parseInt)


mainStyle : Style
mainStyle =
    [ ( "position", "relative" )
    , ( "font-family", "sans-serif" )
    , ( "font-size", "12px" )
    , ( "text-align", "center" )
    , ( "margin", "10px" )
    , ( "margin-left", "25px" )
    , ( "width", "150px" )
    , ( "padding", "10px" )
    , ( "padding-left", "40px" )
    , ( "padding-right", "20px" )
    , ( "border", "2px solid black" )
    ]


inputStyle : Style
inputStyle =
    [ ( "position", "absolute" )
    , ( "left", "-20px" )
    , ( "top", "-6px" )
    , ( "border", "2px solid black" )
    , ( "border-radius", "4px" )
    , ( "font-size", "20px" )
    , ( "padding-left", "10px" )
    , ( "width", "30px" )
    , ( "height", "40px" )
    ]


view : Int -> Html Msg
view profBonus =
    div
        [ style mainStyle ]
        [ text "PROFICIENCY BONUS"
        , input
            [ type_ "number"
            , value (toString profBonus)
            , style inputStyle
            , onInput (parseInt >> ChangeProf)
            ]
            []
        ]
