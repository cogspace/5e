module Model.Abilities
    exposing
        ( Abilities
        , AbilityScores
        , SaveProfs
        , Ability(..)
        , all
        , zero
        , base
        , name
        , value
        , modifier
        , update
        )


type Ability
    = Strength
    | Dexterity
    | Constitution
    | Intelligence
    | Wisdom
    | Charisma


type alias Abilities a =
    { str : a
    , dex : a
    , con : a
    , int : a
    , wis : a
    , cha : a
    }


type alias AbilityScores =
    Abilities Int


type alias SaveProfs =
    Abilities Bool


all : a -> Abilities a
all a =
    { str = a
    , dex = a
    , con = a
    , int = a
    , wis = a
    , cha = a
    }


zero : AbilityScores
zero =
    all 0


base : AbilityScores
base =
    all 8


modifier : AbilityScores -> Ability -> Int
modifier abilities ability =
    value abilities ability |> mod


mod : Int -> Int
mod attr =
    attr // 2 - 5


value : Abilities a -> Ability -> a
value model ability =
    case ability of
        Strength ->
            model.str

        Dexterity ->
            model.dex

        Constitution ->
            model.con

        Intelligence ->
            model.int

        Wisdom ->
            model.wis

        Charisma ->
            model.cha


name : Ability -> String
name ability =
    case ability of
        Strength ->
            "strength"

        Dexterity ->
            "dexterity"

        Constitution ->
            "constitution"

        Intelligence ->
            "intelligence"

        Wisdom ->
            "wisdom"

        Charisma ->
            "charisma"


update : Abilities a -> Ability -> a -> Abilities a
update abilities ability val =
    case ability of
        Strength ->
            { abilities | str = val }

        Dexterity ->
            { abilities | dex = val }

        Constitution ->
            { abilities | con = val }

        Intelligence ->
            { abilities | int = val }

        Wisdom ->
            { abilities | wis = val }

        Charisma ->
            { abilities | cha = val }
