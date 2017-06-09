module Model.Abilities
    exposing
        ( Abilities
        , AbilityScores
        , AbilityProfs
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
    = Str
    | Dex
    | Con
    | Int
    | Wis
    | Cha


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


type alias AbilityProfs =
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
        Str ->
            model.str

        Dex ->
            model.dex

        Con ->
            model.con

        Int ->
            model.int

        Wis ->
            model.wis

        Cha ->
            model.cha


name : Ability -> String
name ability =
    case ability of
        Str ->
            "strength"

        Dex ->
            "dexterity"

        Con ->
            "constitution"

        Int ->
            "intelligence"

        Wis ->
            "wisdom"

        Cha ->
            "charisma"


update : Abilities a -> Ability -> a -> Abilities a
update abilities ability val =
    case ability of
        Str ->
            { abilities | str = val }

        Dex ->
            { abilities | dex = val }

        Con ->
            { abilities | con = val }

        Int ->
            { abilities | int = val }

        Wis ->
            { abilities | wis = val }

        Cha ->
            { abilities | cha = val }
