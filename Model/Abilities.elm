module Model.Abilities
    exposing
        ( Ability(..)
        , Abilities
        , AbilityScores
        , SaveProfs
        , abilities
        , map
        , all
        , get
        , set
        , name
        , modifier
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


abilities : List Ability
abilities =
    [ Strength
    , Dexterity
    , Constitution
    , Intelligence
    , Wisdom
    , Charisma
    ]


map : (Ability -> b) -> List b
map func =
    List.map func abilities


all : a -> Abilities a
all a =
    { str = a
    , dex = a
    , con = a
    , int = a
    , wis = a
    , cha = a
    }


modifier : AbilityScores -> Ability -> Int
modifier abilities ability =
    abilities
        |> get ability
        |> mod


mod : Int -> Int
mod attr =
    attr // 2 - 5


get : Ability -> Abilities a -> a
get ability model =
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
            "Strength"

        Dexterity ->
            "Dexterity"

        Constitution ->
            "Constitution"

        Intelligence ->
            "Intelligence"

        Wisdom ->
            "Wisdom"

        Charisma ->
            "Charisma"


set : Ability -> a -> Abilities a -> Abilities a
set ability val abilities =
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
