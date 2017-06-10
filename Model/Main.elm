module Model.Main
    exposing
        ( Msg(..)
        , Race(..)
        , Model
        , model
        , update
        )

import Model.Abilities as Abilities
    exposing
        ( Ability
        , AbilityScores
        , SaveProfs
        , Abilities
        )
import Model.Skills as Skills
    exposing
        ( Skill
        , SkillProfs
        )


type Race
    = Dwarf
    | Elf
    | Halfling
    | Human


type Class
    = Cleric
    | Fighter
    | Rogue
    | Wizard


type alias Model =
    { charName : String
    , playerName : String
    , race : Race
    , class : Class
    , profBonus : Int
    , abilities : AbilityScores
    , saveProfs : SaveProfs
    , skillProfs : SkillProfs
    }


model : Model
model =
    { charName = ""
    , playerName = ""
    , race = Human
    , class = Fighter
    , profBonus = 1
    , abilities = (Abilities.all 8)
    , saveProfs = (Abilities.all False)
    , skillProfs = (Skills.all False)
    }


(#|) : String -> Int -> Int
(#|) str default =
    let
        n =
            String.toInt str
                |> Result.toMaybe
                |> Maybe.withDefault default
    in
        if n < 0 then
            0
        else if n > 24 then
            24
        else
            n


type Msg
    = ChangeAbility Ability Int
    | ChangeProf Int
    | ToggleSaveProf Ability
    | ToggleSkillProf Skill


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeAbility ability val ->
            { model
                | abilities =
                    model.abilities
                        |> Abilities.set ability val
            }

        ChangeProf val ->
            { model | profBonus = val }

        ToggleSaveProf ability ->
            let
                prof =
                    model.saveProfs
                        |> Abilities.get ability
            in
                { model
                    | saveProfs =
                        model.saveProfs
                            |> Abilities.set ability (not prof)
                }

        ToggleSkillProf skill ->
            let
                prof =
                    model.skillProfs
                        |> Skills.get skill
            in
                { model
                    | skillProfs =
                        model.skillProfs
                            |> Skills.set skill (not prof)
                }
