module View.PassivePerception exposing (view)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (type_, value, style)
import Model.Main exposing (Model, Msg(..))
import Style exposing (Style)


mainStyle : Style
mainStyle =
    [ ( "position", "relative" )
    , ( "font-family", "sans-serif" )
    , ( "font-size", "12px" )
    , ( "text-align", "center" )
    , ( "margin", "10px" )
    , ( "margin-left", "25px" )
    , ( "background-color", "white" )
    , ( "width", "150px" )
    , ( "height", "28px" )
    , ( "padding", "2px" )
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
    , ( "background-color", "white" )
    , ( "font-size", "20px" )
    , ( "text-align", "center" )
    , ( "width", "40px" )
    , ( "height", "40px" )
    , ( "line-height", "40px" )
    ]


view : Int -> Html Msg
view passivePerception =
    div
        [ style mainStyle ]
        [ text "PASSIVE WISDOM (PERCEPTION)"
        , div
            [ style inputStyle ]
            [ text (toString passivePerception) ]
        ]
