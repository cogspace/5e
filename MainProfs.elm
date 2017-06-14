module MainProfs exposing (Msg, Model, model, view, update)

import Tuple
import Dict exposing (Dict)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Style exposing (Style)
import Utils exposing (toModString, checkbox)


type alias Model =
    List ( String, Bool )


type alias Mods =
    Dict String Int


type Msg
    = ToggleProf String


model : List String -> Model
model names =
    names
        |> List.map (\name -> ( name, False ))


get : String -> Model -> Bool
get prof model =
    model
        |> Dict.fromList
        |> Dict.get prof
        |> Maybe.withDefault False


set : String -> Bool -> Model -> Model
set prof val model =
    model
        |> List.map
            (\item ->
                let
                    key =
                        Tuple.first item
                in
                    if key == prof then
                        ( key, val )
                    else
                        item
            )


toggle : String -> Model -> Model
toggle prof model =
    model
        |> set prof (model |> get prof |> not)


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleProf prof ->
            model |> toggle prof


mainStyle : Style
mainStyle =
    [ ( "position", "relative" )
    , ( "font-family", "sans-serif" )
    , ( "font-size", "12px" )
    , ( "text-align", "left" )
    , ( "margin", "7px" )
    , ( "width", "208px" )
    , ( "padding", "10px" )
    , ( "border", "2px solid black" )
    , ( "border-radius", "4px" )
    ]


profStyle : Style
profStyle =
    [ ( "height", "20px" )
    , ( "vertical-align", "baseline" )
    ]


titleStyle : Style
titleStyle =
    [ ( "text-align", "center" )
    , ( "font-weight", "bold" )
    , ( "margin-top", "8px" )
    ]


viewProf : (Msg -> msg) -> Mods -> Int -> Model -> String -> Html msg
viewProf msg mods profBonus model prof =
    let
        mod =
            mods
                |> Dict.get prof
                |> Maybe.withDefault 0

        hasProf =
            model
                |> Dict.fromList
                |> Dict.get prof
                |> Maybe.withDefault False

        bonus =
            if hasProf then
                profBonus
            else
                0
    in
        div [ style profStyle ]
            [ checkbox
                [ checked hasProf
                , onClick (msg <| ToggleProf prof)
                ]
                []
            , text (toModString (mod + bonus))
            , text " "
            , text prof
            ]


view : (Msg -> msg) -> Mods -> Int -> String -> Model -> Html msg
view msg mods profBonus title model =
    let
        profs =
            model
                |> List.map Tuple.first
                |> List.map (viewProf msg mods profBonus model)
    in
        div [ style mainStyle ]
            [ div [] profs
            , div [ style titleStyle ]
                [ text title ]
            ]
