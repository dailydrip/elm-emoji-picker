module Main exposing (..)

import Html exposing (..)


type alias Model =
    { emojiPrefix : String
    }


type Msg
    = NoOp


init : ( Model, Cmd Msg )
init =
    initialModel ! []


initialModel : Model
initialModel =
    { emojiPrefix = "" }


main =
    Html.program
        { update = update
        , view = view
        , init = init
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div [] [ text "emoji goes here" ]
