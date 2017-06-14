module Main exposing (..)

import Dict exposing (Dict)
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (style)
import Style exposing (Style)
import Model.Main exposing (Msg(..), Model, model, update)
import MainProfs
import OtherProfs
import View.Abilities
import View.ProfBonus
import View.PassivePerception


columnStyle : Style
columnStyle =
    [ ( "display", "inline-block" )
    , ( "vertical-align", "top" )
    ]


view : Model -> Html Msg
view model =
    let
        mod accessor =
            (accessor model.abilities) // 2 - 5

        mods =
            Dict.fromList
                [ ( "Strength", mod .str )
                , ( "Dexterity", mod .dex )
                , ( "Constitution", mod .con )
                , ( "Intelligence", mod .int )
                , ( "Wisdom", mod .wis )
                , ( "Charisma", mod .cha )
                ]

        skillMods =
            Dict.fromList
                [ ( "Acrobatics (Dex)", mod .dex )
                , ( "Animal Handling (Wis)", mod .wis )
                , ( "Arcana (Int)", mod .int )
                , ( "Athletics (Str)", mod .str )
                , ( "Deception (Cha)", mod .cha )
                , ( "History (Int)", mod .int )
                , ( "Insight (Wis)", mod .wis )
                , ( "Intimidation (Cha)", mod .cha )
                , ( "Investigation (Int)", mod .int )
                , ( "Medicine (Wis)", mod .wis )
                , ( "Nature (Int)", mod .int )
                , ( "Perception (Wis)", mod .wis )
                , ( "Performance (Cha)", mod .cha )
                , ( "Persuasion (Cha)", mod .cha )
                , ( "Religion (Int)", mod .int )
                , ( "Sleight of Hand (Dex)", mod .dex )
                , ( "Stealth (Dex)", mod .dex )
                , ( "Survival (Wis)", mod .wis )
                ]
    in
        div [ style columnStyle ]
            [ div []
                [ div [ style columnStyle ]
                    [ View.Abilities.view model.abilities ]
                , div [ style columnStyle ]
                    [ View.ProfBonus.view model.profBonus
                    , MainProfs.view
                        SaveProfsMsg
                        mods
                        model.profBonus
                        "SAVING THROWS"
                        model.saveProfs
                    , MainProfs.view
                        SkillProfsMsg
                        skillMods
                        model.profBonus
                        "SKILLS"
                        model.skillProfs
                    , View.PassivePerception.view model
                    ]
                ]
            , div []
                [ OtherProfs.view
                    OtherProfsMsg
                    model.otherProfs
                ]
            ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
