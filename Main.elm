module Main exposing (..)

import Dict exposing (Dict)
import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Events exposing (onClick, onInput)
import Emoji exposing (Emoji, emojis)
import Html exposing (Html)
import Ports
import Styles exposing (Styles(..))


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
    Element.root Styles.stylesheet <|
        column None
            []
            [ el None [ center, width (px 400) ] <|
                column None
                    []
                    [ inputText None
                        [ onInput UpdatePrefix
                        , placeholder "Search for an emoji"
                        ]
                        model.searchString
                    , el SelectedEmoji [] <| text selectedEmojiString
                    , viewEmojiList model.searchString
                    ]
            ]


viewEmojiList : String -> Element Styles variation Msg
viewEmojiList searchPrefix =
    let
        filteredEmoji =
            Emoji.emojis
                |> Emoji.search searchPrefix
                |> Emoji.toList
    in
    wrappedRow EmojiList [] <|
        List.map viewEmoji filteredEmoji


viewEmoji : ( String, Emoji ) -> Element Styles variation Msg
viewEmoji ( key, ( emojiString, emojiName, commonNames ) as emoji ) =
    el Emoji
        [ onClick <| SelectEmoji emoji
        , width (px 40)
        , height (px 40)
        ]
    <|
        el None [ center, verticalCenter ] <|
            text emojiString
