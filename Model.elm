module Model exposing (Msg(..), Model, model, update)


type Msg
    = ChangeStr String
    | ChangeDex String
    | ChangeCon String
    | ChangeInt String
    | ChangeWis String
    | ChangeCha String


type alias Model =
    { str : Int
    , dex : Int
    , con : Int
    , int : Int
    , wis : Int
    , cha : Int
    }


model : Model
model =
    { str = 10
    , dex = 10
    , con = 10
    , int = 10
    , wis = 10
    , cha = 10
    }


toIntWithDefault : String -> Int -> Int
toIntWithDefault str int =
    let
        n =
            String.toInt str
                |> Result.toMaybe
                |> Maybe.withDefault int
    in
        if n < 0 then
            0
        else if n > 24 then
            24
        else
            n


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeStr str ->
            { model | str = toIntWithDefault str model.str }

        ChangeDex dex ->
            { model | dex = toIntWithDefault dex model.dex }

        ChangeCon con ->
            { model | con = toIntWithDefault con model.con }

        ChangeInt int ->
            { model | int = toIntWithDefault int model.int }

        ChangeWis wis ->
            { model | wis = toIntWithDefault wis model.wis }

        ChangeCha cha ->
            { model | cha = toIntWithDefault cha model.cha }
