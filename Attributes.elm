module Attributes exposing (view)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (class, style, type_, value)
import Html.Events exposing (onInput)
import Model exposing (Model, Msg(..))


type alias Style =
    List ( String, String )


mod : Int -> Int
mod attr =
    attr // 2 - 5


mainStyle : Style
mainStyle =
    [ ( "display", "inline-block" )
    ]


attributeStyle : Style
attributeStyle =
    [ ( "border", "2px solid black" )
    , ( "position", "relative" )
    , ( "width", "60px" )
    , ( "height", "60px" )
    , ( "text-align", "center" )
    , ( "margin", "10px" )
    , ( "font-family", "sans-serif" )
    , ( "margin-bottom", "25px" )
    ]


attributeModStyle : Style
attributeModStyle =
    [ ( "font-size", "30px" )
    ]


attributeNameStyle : Style
attributeNameStyle =
    [ ( "font-size", "12px" )
    , ( "font-weight", "bold" )
    , ( "color", "gray" )
    ]


attributeScoreStyle : Style
attributeScoreStyle =
    [ ( "display", "block" )
    , ( "position", "absolute" )
    , ( "bottom", "-16px" )
    , ( "left", "8px" )
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
        [ viewAttribute "STR" model.str ChangeStr
        , viewAttribute "DEX" model.dex ChangeDex
        , viewAttribute "CON" model.con ChangeCon
        , viewAttribute "INT" model.int ChangeInt
        , viewAttribute "WIS" model.wis ChangeWis
        , viewAttribute "CHA" model.cha ChangeCha
        ]


viewAttribute : String -> Int -> (String -> Msg) -> Html Msg
viewAttribute label attr msg =
    div
        [ style attributeStyle ]
        [ div
            [ style attributeNameStyle ]
            [ text label
            ]
        , div
            [ style attributeModStyle ]
            [ text <| toPosString <| mod attr
            ]
        , input
            [ type_ "number"
            , style attributeScoreStyle
            , value <| toString attr
            , onInput msg
            ]
            []
        ]
