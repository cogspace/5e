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


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeStr str ->
            { model | str = str #| model.str }

        ChangeDex dex ->
            { model | dex = dex #| model.dex }

        ChangeCon con ->
            { model | con = con #| model.con }

        ChangeInt int ->
            { model | int = int #| model.int }

        ChangeWis wis ->
            { model | wis = wis #| model.wis }

        ChangeCha cha ->
            { model | cha = cha #| model.cha }
