module Model.Main
    exposing
        ( Msg(..)
        , Race(..)
        , Model
        , model
        , update
        )

import Set exposing (Set)
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
    , languages : Set String
    , languageToAdd : String
    , profs : Set String
    , profToAdd : String
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
    , languages = Set.fromList [ "Common" ]
    , languageToAdd = ""
    , profs = Set.empty
    , profToAdd = ""
    }


type Msg
    = ChangeAbility Ability Int
    | ChangeProf Int
    | ToggleSaveProf Ability
    | ToggleSkillProf Skill
    | ChangeLanguageToAdd String
    | AddLanguage
    | RemoveLanguage String
    | ChangeProfToAdd String
    | AddProf
    | RemoveProf String


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

        ChangeLanguageToAdd lang ->
            { model | languageToAdd = lang }

        AddLanguage ->
            { model
                | languages =
                    if model.languageToAdd == "" then
                        model.languages
                    else
                        model.languages
                            |> Set.insert
                                model.languageToAdd
                , languageToAdd = ""
            }

        RemoveLanguage lang ->
            { model
                | languages =
                    model.languages |> Set.remove lang
            }

        ChangeProfToAdd prof ->
            { model | profToAdd = prof }

        AddProf ->
            { model
                | profs =
                    if model.profToAdd == "" then
                        model.profs
                    else
                        model.profs
                            |> Set.insert
                                model.profToAdd
                , profToAdd = ""
            }

        RemoveProf prof ->
            { model
                | profs =
                    model.profs |> Set.remove prof
            }
