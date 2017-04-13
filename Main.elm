module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Dict exposing (Dict)
import Emoji exposing (Emoji, emojis)


type alias Model =
    { searchString : String
    , selectedEmoji : Maybe String
    }


type Msg
    = SelectEmoji String
    | UpdatePrefix String


init : ( Model, Cmd Msg )
init =
    initialModel ! []


initialModel : Model
initialModel =
    { searchString = ""
    , selectedEmoji = Nothing
    }


main : Program Never Model Msg
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
    case msg of
        SelectEmoji selected ->
            ( { model | selectedEmoji = Just selected }
            , Cmd.none
            )

        UpdatePrefix prefix ->
            ( { model | searchString = prefix }, Cmd.none )


view : Model -> Html Msg
view model =
    div
        []
        [ input
            [ type_ "text"
            , onInput UpdatePrefix
            , placeholder "Search for an emoji"
            ]
            []
        , h2 [] [ text <| Maybe.withDefault "No selection" model.selectedEmoji ]
        , viewEmojiList model.searchString
        ]


viewEmojiList : String -> Html Msg
viewEmojiList searchPrefix =
    div [] <|
        List.map viewEmoji (Emoji.toList emojis)


viewEmoji : ( String, Emoji ) -> Html Msg
viewEmoji ( key, ( emojiString, names ) ) =
    div
        [ class "emoji"
        , onClick <| SelectEmoji emojiString
        ]
        [ text emojiString ]
