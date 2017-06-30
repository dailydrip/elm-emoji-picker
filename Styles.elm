module Styles exposing (Styles(..), stylesheet)

import Color exposing (rgba)
import Style exposing (..)
import Style.Color as Color
import Style.Transition as Transition
import Time


{-| Here's where we define all of the named styles that exist in our app.

It's nice to have a blank style.

-}
type Styles
    = None
    | SelectedEmoji
    | EmojiList
    | Emoji


colors =
    { lightGrey = rgba 230 230 230 1
    , transparent = rgba 0 0 0 0
    }


{-| Then, we define a stylesheet. This describes all of the properties that
aren't related to layout, position, or size.
-}
stylesheet : StyleSheet Styles variations
stylesheet =
    Style.stylesheet
        [ style None [] -- our None style adds no styles.
        , style SelectedEmoji
            []
        , style EmojiList
            []
        , style Emoji
            [ Color.background colors.transparent
            , Transition.transitions
                [ { delay = 0
                  , duration = Time.second * 0.5
                  , easing = "ease-in-out"
                  , props = [ "all" ]
                  }
                ]
            , cursor "pointer"
            , hover
                [ Color.background colors.lightGrey
                ]
            ]
        ]
