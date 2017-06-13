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
import Profs


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
    , profs : Profs.Model
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
    , profs = Profs.model
    }


type Msg
    = ChangeAbility Ability Int
    | ChangeProf Int
    | ToggleSaveProf Ability
    | ToggleSkillProf Skill
    | ProfsMsg Profs.Msg


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

                new =
                    model.saveProfs
                        |> Abilities.set ability (not prof)
            in
                { model | saveProfs = new }

        ToggleSkillProf skill ->
            let
                prof =
                    model.skillProfs
                        |> Skills.get skill

                new =
                    model.skillProfs
                        |> Skills.set skill (not prof)
            in
                { model | skillProfs = new }

        ProfsMsg m ->
            { model | profs = model.profs |> Profs.update m }
