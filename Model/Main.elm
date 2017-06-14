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
import MainProfs
import OtherProfs


saves : List String
saves =
    [ "Strength"
    , "Dexterity"
    , "Constitution"
    , "Intelligence"
    , "Wisdom"
    , "Charisma"
    ]


skills : List String
skills =
    [ "Acrobatics (Dex)"
    , "Animal Handling (Wis)"
    , "Arcana (Int)"
    , "Athletics (Str)"
    , "Deception (Cha)"
    , "History (Int)"
    , "Insight (Wis)"
    , "Intimidation (Cha)"
    , "Investigation (Int)"
    , "Medicine (Wis)"
    , "Nature (Int)"
    , "Perception (Wis)"
    , "Performance (Cha)"
    , "Persuasion (Cha)"
    , "Religion (Int)"
    , "Sleight of Hand (Dex)"
    , "Stealth (Dex)"
    , "Survival (Wis)"
    ]


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
    , saveProfs : MainProfs.Model
    , skillProfs : MainProfs.Model
    , otherProfs : OtherProfs.Model
    }


model : Model
model =
    { charName = ""
    , playerName = ""
    , race = Human
    , class = Fighter
    , profBonus = 1
    , abilities = (Abilities.all 8)
    , saveProfs = MainProfs.model saves
    , skillProfs = MainProfs.model skills
    , otherProfs = OtherProfs.model
    }


type Msg
    = ChangeAbility Ability Int
    | ChangeProf Int
    | SaveProfsMsg MainProfs.Msg
    | SkillProfsMsg MainProfs.Msg
    | OtherProfsMsg OtherProfs.Msg


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

        SaveProfsMsg m ->
            { model | saveProfs = model.saveProfs |> MainProfs.update m }

        SkillProfsMsg m ->
            { model | skillProfs = model.skillProfs |> MainProfs.update m }

        OtherProfsMsg m ->
            { model
                | otherProfs =
                    model.otherProfs
                        |> OtherProfs.update m
            }
