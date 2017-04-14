module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Dict exposing (Dict)
import Emoji exposing (Emoji, emojis)
import Ports


type alias Model =
    { searchString : String
    , selectedEmoji : Maybe Emoji
    }


type Msg
    = SelectEmoji Emoji
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
    let
        nextModel =
            case msg of
                SelectEmoji selected ->
                    { model | selectedEmoji = Just selected }

                UpdatePrefix prefix ->
                    { model | searchString = prefix }
    in
        case nextModel.selectedEmoji of
            Nothing ->
                nextModel ! []

            Just ( _, name, _ ) ->
                nextModel ! [ Ports.selectedEmoji name ]


view : Model -> Html Msg
view model =
    let
        selectedEmojiString =
            case model.selectedEmoji of
                Just ( emojiString, emojiName, commonNames ) ->
                    emojiString

                Nothing ->
                    "No selection"
    in
        div
            []
            [ input
                [ type_ "text"
                , onInput UpdatePrefix
                , placeholder "Search for an emoji"
                ]
                []
            , h2 [] [ text selectedEmojiString ]
            , viewEmojiList model.searchString
            ]


viewEmojiList : String -> Html Msg
viewEmojiList searchPrefix =
    let
        filteredEmoji =
            Emoji.emojis
                |> Emoji.search searchPrefix
                |> Emoji.toList
    in
        div [] <|
            List.map viewEmoji filteredEmoji


viewEmoji : ( String, Emoji ) -> Html Msg
viewEmoji ( key, ( emojiString, emojiName, commonNames ) as emoji ) =
    div
        [ class "emoji"
        , onClick <| SelectEmoji emoji
        ]
        [ text emojiString ]
