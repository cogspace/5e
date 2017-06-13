module View.Proficiencies exposing (view)

import Set exposing (Set)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model.Main exposing (Model, Msg(..))
import Style exposing (Style)


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


viewProfsGroup :
    String
    -> Set String
    -> String
    -> (String -> Msg)
    -> Msg
    -> (String -> Msg)
    -> Html Msg
viewProfsGroup title profs profToAdd change add remove =
    div []
        [ div [ style languagesHeaderStyle ]
            [ text (title ++ ": ")
            , input
                [ type_ "text"
                , value profToAdd
                , onInput change
                ]
                []
            , button [ onClick add ]
                [ text "Add" ]
            ]
        , profs
            |> Set.toList
            |> List.map (viewProf remove)
            |> ul [ style languagesStyle ]
        ]


viewProfs : Model -> Html Msg
viewProfs model =
    div [ style profsStyle ]
        [ viewProfsGroup
            "Proficiencies"
            model.profs
            model.profToAdd
            ChangeProfToAdd
            AddProf
            RemoveProf
        , viewProfsGroup
            "Languages"
            model.languages
            model.languageToAdd
            ChangeLanguageToAdd
            AddLanguage
            RemoveLanguage
        ]


viewProf : (String -> Msg) -> String -> Html Msg
viewProf remove prof =
    li [ style languageStyle ]
        [ text prof
        , text " "
        , button [ onClick (remove prof) ]
            [ text "X" ]
        ]


view : Model -> Html Msg
view model =
    div [ style mainStyle ]
        [ viewProfs model
        , div [ style titleStyle ]
            [ text "LANGUAGES & OTHER PROFICIENCIES"
            ]
        ]
