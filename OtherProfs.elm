module OtherProfs exposing (Model, Msg(..), model, view, update)

import Set exposing (Set)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Style exposing (Style)


type alias Model =
    { profs : ProfsModel
    , langs : ProfsModel
    }


type alias ProfsModel =
    { profs : Set String
    , toAdd : String
    }


type Msg
    = Other ProfsMsg
    | Langs ProfsMsg


type ProfsMsg
    = Change String
    | Add
    | Remove String


model : Model
model =
    { profs = ProfsModel Set.empty ""
    , langs = ProfsModel (Set.fromList [ "Common" ]) ""
    }


updateProfs : ProfsMsg -> ProfsModel -> ProfsModel
updateProfs msg model =
    case msg of
        Change value ->
            { model | toAdd = value }

        Add ->
            { model
                | profs =
                    model.profs
                        |> Set.insert model.toAdd
                , toAdd = ""
            }

        Remove value ->
            { model
                | profs =
                    model.profs
                        |> Set.remove value
            }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Other pm ->
            { model | profs = model.profs |> updateProfs pm }

        Langs lm ->
            { model | langs = model.langs |> updateProfs lm }


mainStyle : Style
mainStyle =
    [ ( "position", "relative" )
    , ( "font-family", "sans-serif" )
    , ( "font-size", "12px" )
    , ( "text-align", "left" )
    , ( "margin", "7px" )
    , ( "width", "330px" )
    , ( "padding", "10px" )
    , ( "border", "2px solid black" )
    , ( "border-radius", "4px" )
    ]


profStyle : Style
profStyle =
    [ ( "height", "20px" )
    , ( "vertical-align", "baseline" )
    ]


profsStyle : Style
profsStyle =
    [ ( "height", "350px" )
    ]


titleStyle : Style
titleStyle =
    [ ( "text-align", "center" )
    , ( "font-weight", "bold" )
    , ( "margin-top", "8px" )
    ]


languagesHeaderStyle : Style
languagesHeaderStyle =
    [ ( "font-weight", "bold" )
    ]


languagesStyle : Style
languagesStyle =
    [ ( "padding-left", "0" )
    ]


languageStyle : Style
languageStyle =
    [ ( "list-item-type", "none" )
    , ( "display", "inline-block" )
    , ( "padding-left", "4px" )
    , ( "border", "4px double white" )
    , ( "background-color", "silver" )
    ]


viewProf : (String -> msg) -> String -> Html msg
viewProf remove prof =
    li [ style languageStyle ]
        [ text prof
        , text " "
        , button [ onClick (remove prof) ]
            [ text "X" ]
        ]


viewProfsGroup : (Msg -> msg) -> String -> (ProfsMsg -> Msg) -> ProfsModel -> Html msg
viewProfsGroup msg title group model =
    div []
        [ div [ style languagesHeaderStyle ]
            [ text (title ++ ": ")
            , input
                [ type_ "text"
                , value model.toAdd
                , onInput (msg << group << Change)
                ]
                []
            , button [ onClick (msg (group Add)) ]
                [ text "Add" ]
            ]
        , model.profs
            |> Set.toList
            |> List.map (viewProf (msg << group << Remove))
            |> ul [ style languagesStyle ]
        ]


viewProfs : (Msg -> msg) -> Model -> Html msg
viewProfs msg model =
    div [ style profsStyle ]
        [ model.profs
            |> viewProfsGroup msg "Proficiencies" Other
        , model.langs
            |> viewProfsGroup msg "Languages" Langs
        ]


view : (Msg -> msg) -> Model -> Html msg
view msg model =
    div [ style mainStyle ]
        [ viewProfs msg model
        , div [ style titleStyle ]
            [ text "LANGUAGES & OTHER PROFICIENCIES"
            ]
        ]
