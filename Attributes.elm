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
    , ( "background-color", "#ddd" )
    , ( "border-radius", "8px" )
    ]


attributeStyle : Style
attributeStyle =
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


attributeModStyle : Style
attributeModStyle =
    [ ( "font-size", "32px" )
    , ( "line-height", "50px" )
    ]


attributeNameStyle : Style
attributeNameStyle =
    [ ( "font-size", "10px" )
    , ( "margin-top", "4px" )
    ]


attributeScoreStyle : Style
attributeScoreStyle =
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
        [ viewAttribute "STRENGTH" model.str ChangeStr
        , viewAttribute "DEXTERITY" model.dex ChangeDex
        , viewAttribute "CONSTITUTION" model.con ChangeCon
        , viewAttribute "INTELLIGENCE" model.int ChangeInt
        , viewAttribute "WISDOM" model.wis ChangeWis
        , viewAttribute "CHARISMA" model.cha ChangeCha
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
