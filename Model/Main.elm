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
        ( AbilityScores
        , SaveProfs
        , Ability
        , Abilities
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
    }


model : Model
model =
    { charName = ""
    , playerName = ""
    , race = Human
    , class = Fighter
    , profBonus = 1
    , abilities = Abilities.base
    , saveProfs = (Abilities.all False)
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


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeAbility ability val ->
            let
                old =
                    model.abilities

                new =
                    Abilities.update old ability val
            in
                { model | abilities = new }

        ChangeProf val ->
            { model | profBonus = val }

        ToggleSaveProf ability ->
            let
                old =
                    model.saveProfs

                prof =
                    Abilities.value old ability

                new =
                    Abilities.update old ability (not prof)
            in
                { model | saveProfs = new }
