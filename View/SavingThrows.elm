module View.SavingThrows exposing (view)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (type_, style, checked)
import Html.Events exposing (onClick)
import Model.Main exposing (Model, Msg(..))
import Model.Abilities as Abilities exposing (Ability)
import Style exposing (Style)
import Utils exposing (toModString, checkbox)


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


viewProf : Model -> Ability -> Html Msg
viewProf model ability =
    let
        { abilities, saveProfs } =
            model

        name =
            Abilities.name ability

        prof =
            saveProfs |> Abilities.get ability

        profBonus =
            if prof then
                model.profBonus
            else
                0

        mod =
            Abilities.modifier abilities ability
                + profBonus
    in
        div [ style profStyle ]
            [ checkbox
                [ checked prof
                , onClick (ToggleSaveProf ability)
                ]
                []
            , text (toModString mod)
            , text " "
            , text name
            ]


view : Model -> Html Msg
view model =
    div [ style mainStyle ]
        (Abilities.map (viewProf model)
            ++ [ div [ style titleStyle ]
                    [ text "SAVING THROWS" ]
               ]
        )
