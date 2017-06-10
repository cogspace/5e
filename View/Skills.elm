module View.Skills exposing (view)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (type_, style, checked)
import Html.Events exposing (onClick)
import Model.Main exposing (Model, Msg(..))
import Model.Abilities as Abilities
import Model.Skills as Skills exposing (Skill)
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


viewSkill : Model -> Skill -> Html Msg
viewSkill model skill =
    let
        prof =
            model.skillProfs
                |> Skills.get skill

        ability =
            Skills.ability skill

        profBonus =
            if prof then
                model.profBonus
            else
                0

        mod =
            Abilities.modifier model.abilities ability
                + profBonus

        name =
            Skills.name skill

        abilityName =
            Abilities.name ability
    in
        div [ style profStyle ]
            [ checkbox
                [ checked prof
                , onClick (ToggleSkillProf skill)
                ]
                []
            , text (toModString mod)
            , text " "
            , text name
            , text " ("
            , text (String.slice 0 3 abilityName)
            , text ")"
            ]


view : Model -> Html Msg
view model =
    div [ style mainStyle ]
        (Skills.map (viewSkill model)
            ++ [ div [ style titleStyle ]
                    [ text "SKILLS" ]
               ]
        )
