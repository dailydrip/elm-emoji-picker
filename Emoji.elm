module Emoji exposing (Emoji, Emojis, emojis, toList, search)

import Dict exposing (Dict)


type alias Emoji =
    ( String, String, List String )


type alias Emojis =
    Dict String Emoji


toList : Emojis -> List ( String, Emoji )
toList =
    Dict.toList


emojiContains : String -> String -> Emoji -> Bool
emojiContains prefix key ( emojiString, emojiName, commonNames ) =
    commonNames
        |> List.any (String.contains prefix)


search : String -> Emojis -> Emojis
search prefix emojis =
    emojis
        |> Dict.filter (emojiContains prefix)


emojis : Emojis
emojis =
    emojiList
        |> Dict.fromList


emojiList : List ( String, Emoji )
emojiList =
    [ ( "00a9", ( "©", "copyright", [ "copyright" ] ) )
    , ( "00ae", ( "®", "registered", [ "registered" ] ) )
    , ( "203c", ( "‼", "bangbang", [ "bangbang" ] ) )
    , ( "2049", ( "⁉", "interrobang", [ "interrobang" ] ) )
    , ( "2122", ( "™", "tm", [ "tm" ] ) )
    , ( "2139", ( "ℹ", "information_source", [ "information_source" ] ) )
    , ( "2194", ( "↔", "left_right_arrow", [ "left_right_arrow" ] ) )
    , ( "2195", ( "↕", "arrow_up_down", [ "arrow_up_down" ] ) )
    , ( "2196", ( "↖", "arrow_upper_left", [ "arrow_upper_left" ] ) )
    , ( "2197", ( "↗", "arrow_upper_right", [ "arrow_upper_right" ] ) )
    , ( "2198", ( "↘", "arrow_lower_right", [ "arrow_lower_right" ] ) )
    , ( "2199", ( "↙", "arrow_lower_left", [ "arrow_lower_left" ] ) )
    , ( "21a9"
      , ( "↩"
        , "leftwards_arrow_with_hook"
        , [ "leftwards_arrow_with_hook" ]
        )
      )
    , ( "21aa", ( "↪", "arrow_right_hook", [ "arrow_right_hook" ] ) )
    , ( "231a", ( "⌚", "watch", [ "watch" ] ) )
    , ( "231b", ( "⌛", "hourglass", [ "hourglass" ] ) )
    , ( "23e9", ( "⏩", "fast_forward", [ "fast_forward" ] ) )
    , ( "23ea", ( "⏪", "rewind", [ "rewind" ] ) )
    , ( "23eb", ( "⏫", "arrow_double_up", [ "arrow_double_up" ] ) )
    , ( "23ec", ( "⏬", "arrow_double_down", [ "arrow_double_down" ] ) )
    , ( "23f0", ( "⏰", "alarm_clock", [ "alarm_clock" ] ) )
    , ( "23f3", ( "⏳", "hourglass_flowing_sand", [ "hourglass_flowing_sand" ] ) )
    , ( "24c2", ( "Ⓜ", "m", [ "m" ] ) )
    , ( "25aa", ( "▪", "black_small_square", [ "black_small_square" ] ) )
    , ( "25ab", ( "▫", "white_small_square", [ "white_small_square" ] ) )
    , ( "25b6", ( "▶", "arrow_forward", [ "arrow_forward" ] ) )
    , ( "25c0", ( "◀", "arrow_backward", [ "arrow_backward" ] ) )
    , ( "25fb", ( "◻", "white_medium_square", [ "white_medium_square" ] ) )
    , ( "25fc", ( "◼", "black_medium_square", [ "black_medium_square" ] ) )
    , ( "25fd"
      , ( "◽"
        , "white_medium_small_square"
        , [ "white_medium_small_square" ]
        )
      )
    , ( "25fe"
      , ( "◾"
        , "black_medium_small_square"
        , [ "black_medium_small_square" ]
        )
      )
    , ( "2600", ( "☀", "sunny", [ "sunny" ] ) )
    , ( "2601", ( "☁", "cloud", [ "cloud" ] ) )
    , ( "260e", ( "☎", "phone", [ "phone", "telephone" ] ) )
    , ( "2611", ( "☑", "ballot_box_with_check", [ "ballot_box_with_check" ] ) )
    , ( "2614", ( "☔", "umbrella", [ "umbrella" ] ) )
    , ( "2615", ( "☕", "coffee", [ "coffee" ] ) )
    , ( "261d", ( "☝", "point_up", [ "point_up" ] ) )
    , ( "263a", ( "☺", "relaxed", [ "relaxed" ] ) )
    , ( "2648", ( "♈", "aries", [ "aries" ] ) )
    , ( "2649", ( "♉", "taurus", [ "taurus" ] ) )
    , ( "264a", ( "♊", "gemini", [ "gemini" ] ) )
    , ( "264b", ( "♋", "cancer", [ "cancer" ] ) )
    , ( "264c", ( "♌", "leo", [ "leo" ] ) )
    , ( "264d", ( "♍", "virgo", [ "virgo" ] ) )
    , ( "264e", ( "♎", "libra", [ "libra" ] ) )
    , ( "264f", ( "♏", "scorpius", [ "scorpius" ] ) )
    , ( "2650", ( "♐", "sagittarius", [ "sagittarius" ] ) )
    , ( "2651", ( "♑", "capricorn", [ "capricorn" ] ) )
    , ( "2652", ( "♒", "aquarius", [ "aquarius" ] ) )
    , ( "2653", ( "♓", "pisces", [ "pisces" ] ) )
    , ( "2660", ( "♠", "spades", [ "spades" ] ) )
    , ( "2663", ( "♣", "clubs", [ "clubs" ] ) )
    , ( "2665", ( "♥", "hearts", [ "hearts" ] ) )
    , ( "2666", ( "♦", "diamonds", [ "diamonds" ] ) )
    , ( "2668", ( "♨", "hotsprings", [ "hotsprings" ] ) )
    , ( "267b", ( "♻", "recycle", [ "recycle" ] ) )
    , ( "267f", ( "♿", "wheelchair", [ "wheelchair" ] ) )
    , ( "2693", ( "⚓", "anchor", [ "anchor" ] ) )
    , ( "26a0", ( "⚠", "warning", [ "warning" ] ) )
    , ( "26a1", ( "⚡", "zap", [ "zap" ] ) )
    , ( "26aa", ( "⚪", "white_circle", [ "white_circle" ] ) )
    , ( "26ab", ( "⚫", "black_circle", [ "black_circle" ] ) )
    , ( "26bd", ( "⚽", "soccer", [ "soccer" ] ) )
    , ( "26be", ( "⚾", "baseball", [ "baseball" ] ) )
    , ( "26c4", ( "⛄", "snowman", [ "snowman" ] ) )
    , ( "26c5", ( "⛅", "partly_sunny", [ "partly_sunny" ] ) )
    , ( "26ce", ( "⛎", "ophiuchus", [ "ophiuchus" ] ) )
    , ( "26d4", ( "⛔", "no_entry", [ "no_entry" ] ) )
    , ( "26ea", ( "⛪", "church", [ "church" ] ) )
    , ( "26f2", ( "⛲", "fountain", [ "fountain" ] ) )
    , ( "26f3", ( "⛳", "golf", [ "golf" ] ) )
    , ( "26f5", ( "⛵", "boat", [ "boat", "sailboat" ] ) )
    , ( "26fa", ( "⛺", "tent", [ "tent" ] ) )
    , ( "26fd", ( "⛽", "fuelpump", [ "fuelpump" ] ) )
    , ( "2702", ( "✂", "scissors", [ "scissors" ] ) )
    , ( "2705", ( "✅", "white_check_mark", [ "white_check_mark" ] ) )
    , ( "2708", ( "✈", "airplane", [ "airplane" ] ) )
    , ( "2709", ( "✉", "email", [ "email", "envelope" ] ) )
    , ( "270a", ( "✊", "fist", [ "fist" ] ) )
    , ( "270b", ( "✋", "hand", [ "hand", "raised_hand" ] ) )
    , ( "270c", ( "✌", "v", [ "v" ] ) )
    , ( "270f", ( "✏", "pencil2", [ "pencil2" ] ) )
    , ( "2712", ( "✒", "black_nib", [ "black_nib" ] ) )
    , ( "2714", ( "✔", "heavy_check_mark", [ "heavy_check_mark" ] ) )
    , ( "2716", ( "✖", "heavy_multiplication_x", [ "heavy_multiplication_x" ] ) )
    , ( "2728", ( "✨", "sparkles", [ "sparkles" ] ) )
    , ( "2733", ( "✳", "eight_spoked_asterisk", [ "eight_spoked_asterisk" ] ) )
    , ( "2734"
      , ( "✴"
        , "eight_pointed_black_star"
        , [ "eight_pointed_black_star" ]
        )
      )
    , ( "2744", ( "❄", "snowflake", [ "snowflake" ] ) )
    , ( "2747", ( "❇", "sparkle", [ "sparkle" ] ) )
    , ( "274c", ( "❌", "x", [ "x" ] ) )
    , ( "274e"
      , ( "❎"
        , "negative_squared_cross_mark"
        , [ "negative_squared_cross_mark" ]
        )
      )
    , ( "2753", ( "❓", "question", [ "question" ] ) )
    , ( "2754", ( "❔", "grey_question", [ "grey_question" ] ) )
    , ( "2755", ( "❕", "grey_exclamation", [ "grey_exclamation" ] ) )
    , ( "2757"
      , ( "❗"
        , "exclamation"
        , [ "exclamation"
          , "heavy_exclamation_mark"
          ]
        )
      )
    , ( "2764", ( "❤", "heart", [ "heart" ] ) )
    , ( "2795", ( "➕", "heavy_plus_sign", [ "heavy_plus_sign" ] ) )
    , ( "2796", ( "➖", "heavy_minus_sign", [ "heavy_minus_sign" ] ) )
    , ( "2797", ( "➗", "heavy_division_sign", [ "heavy_division_sign" ] ) )
    , ( "27a1", ( "➡", "arrow_right", [ "arrow_right" ] ) )
    , ( "27b0", ( "➰", "curly_loop", [ "curly_loop" ] ) )
    , ( "27bf", ( "➿", "loop", [ "loop" ] ) )
    , ( "2934", ( "⤴", "arrow_heading_up", [ "arrow_heading_up" ] ) )
    , ( "2935", ( "⤵", "arrow_heading_down", [ "arrow_heading_down" ] ) )
    , ( "2b05", ( "⬅", "arrow_left", [ "arrow_left" ] ) )
    , ( "2b06", ( "⬆", "arrow_up", [ "arrow_up" ] ) )
    , ( "2b07", ( "⬇", "arrow_down", [ "arrow_down" ] ) )
    , ( "2b1b", ( "⬛", "black_large_square", [ "black_large_square" ] ) )
    , ( "2b1c", ( "⬜", "white_large_square", [ "white_large_square" ] ) )
    , ( "2b50", ( "⭐", "star", [ "star" ] ) )
    , ( "2b55", ( "⭕", "o", [ "o" ] ) )
    , ( "3030", ( "〰", "wavy_dash", [ "wavy_dash" ] ) )
    , ( "303d", ( "〽", "part_alternation_mark", [ "part_alternation_mark" ] ) )
    , ( "3297", ( "㊗", "congratulations", [ "congratulations" ] ) )
    , ( "3299", ( "㊙", "secret", [ "secret" ] ) )
    , ( "1f004", ( "\xD83C\xDC04", "mahjong", [ "mahjong" ] ) )
    , ( "1f0cf", ( "\xD83C\xDCCF", "black_joker", [ "black_joker" ] ) )
    , ( "1f170", ( "\xD83C\xDD70", "a", [ "a" ] ) )
    , ( "1f171", ( "\xD83C\xDD71", "b", [ "b" ] ) )
    , ( "1f17e", ( "\xD83C\xDD7E", "o2", [ "o2" ] ) )
    , ( "1f17f", ( "\xD83C\xDD7F", "parking", [ "parking" ] ) )
    , ( "1f18e", ( "\xD83C\xDD8E", "ab", [ "ab" ] ) )
    , ( "1f191", ( "\xD83C\xDD91", "cl", [ "cl" ] ) )
    , ( "1f192", ( "\xD83C\xDD92", "cool", [ "cool" ] ) )
    , ( "1f193", ( "\xD83C\xDD93", "free", [ "free" ] ) )
    , ( "1f194", ( "\xD83C\xDD94", "id", [ "id" ] ) )
    , ( "1f195", ( "\xD83C\xDD95", "new", [ "new" ] ) )
    , ( "1f196", ( "\xD83C\xDD96", "ng", [ "ng" ] ) )
    , ( "1f197", ( "\xD83C\xDD97", "ok", [ "ok" ] ) )
    , ( "1f198", ( "\xD83C\xDD98", "sos", [ "sos" ] ) )
    , ( "1f199", ( "\xD83C\xDD99", "up", [ "up" ] ) )
    , ( "1f19a", ( "\xD83C\xDD9A", "vs", [ "vs" ] ) )
    , ( "1f201", ( "\xD83C\xDE01", "koko", [ "koko" ] ) )
    , ( "1f202", ( "\xD83C\xDE02", "sa", [ "sa" ] ) )
    , ( "1f21a", ( "\xD83C\xDE1A", "u7121", [ "u7121" ] ) )
    , ( "1f22f", ( "\xD83C\xDE2F", "u6307", [ "u6307" ] ) )
    , ( "1f232", ( "\xD83C\xDE32", "u7981", [ "u7981" ] ) )
    , ( "1f233", ( "\xD83C\xDE33", "u7a7a", [ "u7a7a" ] ) )
    , ( "1f234", ( "\xD83C\xDE34", "u5408", [ "u5408" ] ) )
    , ( "1f235", ( "\xD83C\xDE35", "u6e80", [ "u6e80" ] ) )
    , ( "1f236", ( "\xD83C\xDE36", "u6709", [ "u6709" ] ) )
    , ( "1f237", ( "\xD83C\xDE37", "u6708", [ "u6708" ] ) )
    , ( "1f238", ( "\xD83C\xDE38", "u7533", [ "u7533" ] ) )
    , ( "1f239", ( "\xD83C\xDE39", "u5272", [ "u5272" ] ) )
    , ( "1f23a", ( "\xD83C\xDE3A", "u55b6", [ "u55b6" ] ) )
    , ( "1f250"
      , ( "\xD83C\xDE50"
        , "ideograph_advantage"
        , [ "ideograph_advantage" ]
        )
      )
    , ( "1f251", ( "\xD83C\xDE51", "accept", [ "accept" ] ) )
    , ( "1f300", ( "\xD83C\xDF00", "cyclone", [ "cyclone" ] ) )
    , ( "1f301", ( "\xD83C\xDF01", "foggy", [ "foggy" ] ) )
    , ( "1f302", ( "\xD83C\xDF02", "closed_umbrella", [ "closed_umbrella" ] ) )
    , ( "1f303", ( "\xD83C\xDF03", "night_with_stars", [ "night_with_stars" ] ) )
    , ( "1f304"
      , ( "\xD83C\xDF04"
        , "sunrise_over_mountains"
        , [ "sunrise_over_mountains" ]
        )
      )
    , ( "1f305", ( "\xD83C\xDF05", "sunrise", [ "sunrise" ] ) )
    , ( "1f306", ( "\xD83C\xDF06", "city_sunset", [ "city_sunset" ] ) )
    , ( "1f307", ( "\xD83C\xDF07", "city_sunrise", [ "city_sunrise" ] ) )
    , ( "1f308", ( "\xD83C\xDF08", "rainbow", [ "rainbow" ] ) )
    , ( "1f309", ( "\xD83C\xDF09", "bridge_at_night", [ "bridge_at_night" ] ) )
    , ( "1f30a", ( "\xD83C\xDF0A", "ocean", [ "ocean" ] ) )
    , ( "1f30b", ( "\xD83C\xDF0B", "volcano", [ "volcano" ] ) )
    , ( "1f30c", ( "\xD83C\xDF0C", "milky_way", [ "milky_way" ] ) )
    , ( "1f30d", ( "\xD83C\xDF0D", "earth_africa", [ "earth_africa" ] ) )
    , ( "1f30e", ( "\xD83C\xDF0E", "earth_americas", [ "earth_americas" ] ) )
    , ( "1f30f", ( "\xD83C\xDF0F", "earth_asia", [ "earth_asia" ] ) )
    , ( "1f310"
      , ( "\xD83C\xDF10"
        , "globe_with_meridians"
        , [ "globe_with_meridians" ]
        )
      )
    , ( "1f311", ( "\xD83C\xDF11", "new_moon", [ "new_moon" ] ) )
    , ( "1f312"
      , ( "\xD83C\xDF12"
        , "waxing_crescent_moon"
        , [ "waxing_crescent_moon" ]
        )
      )
    , ( "1f313", ( "\xD83C\xDF13", "first_quarter_moon", [ "first_quarter_moon" ] ) )
    , ( "1f314", ( "\xD83C\xDF14", "moon", [ "moon", "waxing_gibbous_moon" ] ) )
    , ( "1f315", ( "\xD83C\xDF15", "full_moon", [ "full_moon" ] ) )
    , ( "1f316"
      , ( "\xD83C\xDF16"
        , "waning_gibbous_moon"
        , [ "waning_gibbous_moon" ]
        )
      )
    , ( "1f317", ( "\xD83C\xDF17", "last_quarter_moon", [ "last_quarter_moon" ] ) )
    , ( "1f318"
      , ( "\xD83C\xDF18"
        , "waning_crescent_moon"
        , [ "waning_crescent_moon" ]
        )
      )
    , ( "1f319", ( "\xD83C\xDF19", "crescent_moon", [ "crescent_moon" ] ) )
    , ( "1f320", ( "\xD83C\xDF20", "stars", [ "stars" ] ) )
    , ( "1f31a", ( "\xD83C\xDF1A", "new_moon_with_face", [ "new_moon_with_face" ] ) )
    , ( "1f31b"
      , ( "\xD83C\xDF1B"
        , "first_quarter_moon_with_face"
        , [ "first_quarter_moon_with_face" ]
        )
      )
    , ( "1f31c"
      , ( "\xD83C\xDF1C"
        , "last_quarter_moon_with_face"
        , [ "last_quarter_moon_with_face" ]
        )
      )
    , ( "1f31d"
      , ( "\xD83C\xDF1D"
        , "full_moon_with_face"
        , [ "full_moon_with_face" ]
        )
      )
    , ( "1f31e", ( "\xD83C\xDF1E", "sun_with_face", [ "sun_with_face" ] ) )
    , ( "1f31f", ( "\xD83C\xDF1F", "star2", [ "star2" ] ) )
    , ( "1f330", ( "\xD83C\xDF30", "chestnut", [ "chestnut" ] ) )
    , ( "1f331", ( "\xD83C\xDF31", "seedling", [ "seedling" ] ) )
    , ( "1f332", ( "\xD83C\xDF32", "evergreen_tree", [ "evergreen_tree" ] ) )
    , ( "1f333", ( "\xD83C\xDF33", "deciduous_tree", [ "deciduous_tree" ] ) )
    , ( "1f334", ( "\xD83C\xDF34", "palm_tree", [ "palm_tree" ] ) )
    , ( "1f335", ( "\xD83C\xDF35", "cactus", [ "cactus" ] ) )
    , ( "1f337", ( "\xD83C\xDF37", "tulip", [ "tulip" ] ) )
    , ( "1f338", ( "\xD83C\xDF38", "cherry_blossom", [ "cherry_blossom" ] ) )
    , ( "1f339", ( "\xD83C\xDF39", "rose", [ "rose" ] ) )
    , ( "1f33a", ( "\xD83C\xDF3A", "hibiscus", [ "hibiscus" ] ) )
    , ( "1f33b", ( "\xD83C\xDF3B", "sunflower", [ "sunflower" ] ) )
    , ( "1f33c", ( "\xD83C\xDF3C", "blossom", [ "blossom" ] ) )
    , ( "1f33d", ( "\xD83C\xDF3D", "corn", [ "corn" ] ) )
    , ( "1f33e", ( "\xD83C\xDF3E", "ear_of_rice", [ "ear_of_rice" ] ) )
    , ( "1f33f", ( "\xD83C\xDF3F", "herb", [ "herb" ] ) )
    , ( "1f340", ( "\xD83C\xDF40", "four_leaf_clover", [ "four_leaf_clover" ] ) )
    , ( "1f341", ( "\xD83C\xDF41", "maple_leaf", [ "maple_leaf" ] ) )
    , ( "1f342", ( "\xD83C\xDF42", "fallen_leaf", [ "fallen_leaf" ] ) )
    , ( "1f343", ( "\xD83C\xDF43", "leaves", [ "leaves" ] ) )
    , ( "1f344", ( "\xD83C\xDF44", "mushroom", [ "mushroom" ] ) )
    , ( "1f345", ( "\xD83C\xDF45", "tomato", [ "tomato" ] ) )
    , ( "1f346", ( "\xD83C\xDF46", "eggplant", [ "eggplant" ] ) )
    , ( "1f347", ( "\xD83C\xDF47", "grapes", [ "grapes" ] ) )
    , ( "1f348", ( "\xD83C\xDF48", "melon", [ "melon" ] ) )
    , ( "1f349", ( "\xD83C\xDF49", "watermelon", [ "watermelon" ] ) )
    , ( "1f34a", ( "\xD83C\xDF4A", "tangerine", [ "tangerine" ] ) )
    , ( "1f34b", ( "\xD83C\xDF4B", "lemon", [ "lemon" ] ) )
    , ( "1f34c", ( "\xD83C\xDF4C", "banana", [ "banana" ] ) )
    , ( "1f34d", ( "\xD83C\xDF4D", "pineapple", [ "pineapple" ] ) )
    , ( "1f34e", ( "\xD83C\xDF4E", "apple", [ "apple" ] ) )
    , ( "1f34f", ( "\xD83C\xDF4F", "green_apple", [ "green_apple" ] ) )
    , ( "1f350", ( "\xD83C\xDF50", "pear", [ "pear" ] ) )
    , ( "1f351", ( "\xD83C\xDF51", "peach", [ "peach" ] ) )
    , ( "1f352", ( "\xD83C\xDF52", "cherries", [ "cherries" ] ) )
    , ( "1f353", ( "\xD83C\xDF53", "strawberry", [ "strawberry" ] ) )
    , ( "1f354", ( "\xD83C\xDF54", "hamburger", [ "hamburger" ] ) )
    , ( "1f355", ( "\xD83C\xDF55", "pizza", [ "pizza" ] ) )
    , ( "1f356", ( "\xD83C\xDF56", "meat_on_bone", [ "meat_on_bone" ] ) )
    , ( "1f357", ( "\xD83C\xDF57", "poultry_leg", [ "poultry_leg" ] ) )
    , ( "1f358", ( "\xD83C\xDF58", "rice_cracker", [ "rice_cracker" ] ) )
    , ( "1f359", ( "\xD83C\xDF59", "rice_ball", [ "rice_ball" ] ) )
    , ( "1f35a", ( "\xD83C\xDF5A", "rice", [ "rice" ] ) )
    , ( "1f35b", ( "\xD83C\xDF5B", "curry", [ "curry" ] ) )
    , ( "1f35c", ( "\xD83C\xDF5C", "ramen", [ "ramen" ] ) )
    , ( "1f35d", ( "\xD83C\xDF5D", "spaghetti", [ "spaghetti" ] ) )
    , ( "1f35e", ( "\xD83C\xDF5E", "bread", [ "bread" ] ) )
    , ( "1f35f", ( "\xD83C\xDF5F", "fries", [ "fries" ] ) )
    , ( "1f360", ( "\xD83C\xDF60", "sweet_potato", [ "sweet_potato" ] ) )
    , ( "1f361", ( "\xD83C\xDF61", "dango", [ "dango" ] ) )
    , ( "1f362", ( "\xD83C\xDF62", "oden", [ "oden" ] ) )
    , ( "1f363", ( "\xD83C\xDF63", "sushi", [ "sushi" ] ) )
    , ( "1f364", ( "\xD83C\xDF64", "fried_shrimp", [ "fried_shrimp" ] ) )
    , ( "1f365", ( "\xD83C\xDF65", "fish_cake", [ "fish_cake" ] ) )
    , ( "1f366", ( "\xD83C\xDF66", "icecream", [ "icecream" ] ) )
    , ( "1f367", ( "\xD83C\xDF67", "shaved_ice", [ "shaved_ice" ] ) )
    , ( "1f368", ( "\xD83C\xDF68", "ice_cream", [ "ice_cream" ] ) )
    , ( "1f369", ( "\xD83C\xDF69", "doughnut", [ "doughnut" ] ) )
    , ( "1f36a", ( "\xD83C\xDF6A", "cookie", [ "cookie" ] ) )
    , ( "1f36b", ( "\xD83C\xDF6B", "chocolate_bar", [ "chocolate_bar" ] ) )
    , ( "1f36c", ( "\xD83C\xDF6C", "candy", [ "candy" ] ) )
    , ( "1f36d", ( "\xD83C\xDF6D", "lollipop", [ "lollipop" ] ) )
    , ( "1f36e", ( "\xD83C\xDF6E", "custard", [ "custard" ] ) )
    , ( "1f36f", ( "\xD83C\xDF6F", "honey_pot", [ "honey_pot" ] ) )
    , ( "1f370", ( "\xD83C\xDF70", "cake", [ "cake" ] ) )
    , ( "1f371", ( "\xD83C\xDF71", "bento", [ "bento" ] ) )
    , ( "1f372", ( "\xD83C\xDF72", "stew", [ "stew" ] ) )
    , ( "1f373", ( "\xD83C\xDF73", "egg", [ "egg" ] ) )
    , ( "1f374", ( "\xD83C\xDF74", "fork_and_knife", [ "fork_and_knife" ] ) )
    , ( "1f375", ( "\xD83C\xDF75", "tea", [ "tea" ] ) )
    , ( "1f376", ( "\xD83C\xDF76", "sake", [ "sake" ] ) )
    , ( "1f377", ( "\xD83C\xDF77", "wine_glass", [ "wine_glass" ] ) )
    , ( "1f378", ( "\xD83C\xDF78", "cocktail", [ "cocktail" ] ) )
    , ( "1f379", ( "\xD83C\xDF79", "tropical_drink", [ "tropical_drink" ] ) )
    , ( "1f37a", ( "\xD83C\xDF7A", "beer", [ "beer" ] ) )
    , ( "1f37b", ( "\xD83C\xDF7B", "beers", [ "beers" ] ) )
    , ( "1f37c", ( "\xD83C\xDF7C", "baby_bottle", [ "baby_bottle" ] ) )
    , ( "1f380", ( "\xD83C\xDF80", "ribbon", [ "ribbon" ] ) )
    , ( "1f381", ( "\xD83C\xDF81", "gift", [ "gift" ] ) )
    , ( "1f382", ( "\xD83C\xDF82", "birthday", [ "birthday" ] ) )
    , ( "1f383", ( "\xD83C\xDF83", "jack_o_lantern", [ "jack_o_lantern" ] ) )
    , ( "1f384", ( "\xD83C\xDF84", "christmas_tree", [ "christmas_tree" ] ) )
    , ( "1f385", ( "\xD83C\xDF85", "santa", [ "santa" ] ) )
    , ( "1f386", ( "\xD83C\xDF86", "fireworks", [ "fireworks" ] ) )
    , ( "1f387", ( "\xD83C\xDF87", "sparkler", [ "sparkler" ] ) )
    , ( "1f388", ( "\xD83C\xDF88", "balloon", [ "balloon" ] ) )
    , ( "1f389", ( "\xD83C\xDF89", "tada", [ "tada" ] ) )
    , ( "1f38a", ( "\xD83C\xDF8A", "confetti_ball", [ "confetti_ball" ] ) )
    , ( "1f38b", ( "\xD83C\xDF8B", "tanabata_tree", [ "tanabata_tree" ] ) )
    , ( "1f38c", ( "\xD83C\xDF8C", "crossed_flags", [ "crossed_flags" ] ) )
    , ( "1f38d", ( "\xD83C\xDF8D", "bamboo", [ "bamboo" ] ) )
    , ( "1f38e", ( "\xD83C\xDF8E", "dolls", [ "dolls" ] ) )
    , ( "1f38f", ( "\xD83C\xDF8F", "flags", [ "flags" ] ) )
    , ( "1f390", ( "\xD83C\xDF90", "wind_chime", [ "wind_chime" ] ) )
    , ( "1f391", ( "\xD83C\xDF91", "rice_scene", [ "rice_scene" ] ) )
    , ( "1f392", ( "\xD83C\xDF92", "school_satchel", [ "school_satchel" ] ) )
    , ( "1f393", ( "\xD83C\xDF93", "mortar_board", [ "mortar_board" ] ) )
    , ( "1f3a0", ( "\xD83C\xDFA0", "carousel_horse", [ "carousel_horse" ] ) )
    , ( "1f3a1", ( "\xD83C\xDFA1", "ferris_wheel", [ "ferris_wheel" ] ) )
    , ( "1f3a2", ( "\xD83C\xDFA2", "roller_coaster", [ "roller_coaster" ] ) )
    , ( "1f3a3"
      , ( "\xD83C\xDFA3"
        , "fishing_pole_and_fish"
        , [ "fishing_pole_and_fish" ]
        )
      )
    , ( "1f3a4", ( "\xD83C\xDFA4", "microphone", [ "microphone" ] ) )
    , ( "1f3a5", ( "\xD83C\xDFA5", "movie_camera", [ "movie_camera" ] ) )
    , ( "1f3a6", ( "\xD83C\xDFA6", "cinema", [ "cinema" ] ) )
    , ( "1f3a7", ( "\xD83C\xDFA7", "headphones", [ "headphones" ] ) )
    , ( "1f3a8", ( "\xD83C\xDFA8", "art", [ "art" ] ) )
    , ( "1f3a9", ( "\xD83C\xDFA9", "tophat", [ "tophat" ] ) )
    , ( "1f3aa", ( "\xD83C\xDFAA", "circus_tent", [ "circus_tent" ] ) )
    , ( "1f3ab", ( "\xD83C\xDFAB", "ticket", [ "ticket" ] ) )
    , ( "1f3ac", ( "\xD83C\xDFAC", "clapper", [ "clapper" ] ) )
    , ( "1f3ad", ( "\xD83C\xDFAD", "performing_arts", [ "performing_arts" ] ) )
    , ( "1f3ae", ( "\xD83C\xDFAE", "video_game", [ "video_game" ] ) )
    , ( "1f3af", ( "\xD83C\xDFAF", "dart", [ "dart" ] ) )
    , ( "1f3b0", ( "\xD83C\xDFB0", "slot_machine", [ "slot_machine" ] ) )
    , ( "1f3b1", ( "\xD83C\xDFB1", "8ball", [ "8ball" ] ) )
    , ( "1f3b2", ( "\xD83C\xDFB2", "game_die", [ "game_die" ] ) )
    , ( "1f3b3", ( "\xD83C\xDFB3", "bowling", [ "bowling" ] ) )
    , ( "1f3b4"
      , ( "\xD83C\xDFB4"
        , "flower_playing_cards"
        , [ "flower_playing_cards" ]
        )
      )
    , ( "1f3b5", ( "\xD83C\xDFB5", "musical_note", [ "musical_note" ] ) )
    , ( "1f3b6", ( "\xD83C\xDFB6", "notes", [ "notes" ] ) )
    , ( "1f3b7", ( "\xD83C\xDFB7", "saxophone", [ "saxophone" ] ) )
    , ( "1f3b8", ( "\xD83C\xDFB8", "guitar", [ "guitar" ] ) )
    , ( "1f3b9", ( "\xD83C\xDFB9", "musical_keyboard", [ "musical_keyboard" ] ) )
    , ( "1f3ba", ( "\xD83C\xDFBA", "trumpet", [ "trumpet" ] ) )
    , ( "1f3bb", ( "\xD83C\xDFBB", "violin", [ "violin" ] ) )
    , ( "1f3bc", ( "\xD83C\xDFBC", "musical_score", [ "musical_score" ] ) )
    , ( "1f3bd"
      , ( "\xD83C\xDFBD"
        , "running_shirt_with_sash"
        , [ "running_shirt_with_sash" ]
        )
      )
    , ( "1f3be", ( "\xD83C\xDFBE", "tennis", [ "tennis" ] ) )
    , ( "1f3bf", ( "\xD83C\xDFBF", "ski", [ "ski" ] ) )
    , ( "1f3c0", ( "\xD83C\xDFC0", "basketball", [ "basketball" ] ) )
    , ( "1f3c1", ( "\xD83C\xDFC1", "checkered_flag", [ "checkered_flag" ] ) )
    , ( "1f3c2", ( "\xD83C\xDFC2", "snowboarder", [ "snowboarder" ] ) )
    , ( "1f3c3", ( "\xD83C\xDFC3", "runner", [ "runner", "running" ] ) )
    ]



-- I've commented out the following because if I add any more entries to
-- this list if will produce an elm compiler error.
--
--, ( "1f3c4", ( "\xD83C\xDFC4", "surfer", [ "surfer" ] ) )
-- , ( "1f3c6", ( "\xD83C\xDFC6", "trophy", [ "trophy" ] ) )
-- , ( "1f3c7", ( "\xD83C\xDFC7", "horse_racing", [ "horse_racing" ] ) )
-- , ( "1f3c8", ( "\xD83C\xDFC8", "football", [ "football" ] ) )
-- , ( "1f3c9", ( "\xD83C\xDFC9", "rugby_football", [ "rugby_football" ] ) )
-- , ( "1f3ca", ( "\xD83C\xDFCA", "swimmer", [ "swimmer" ] ) )
-- , ( "1f3e0", ( "\xD83C\xDFE0", "house", [ "house" ] ) )
-- , ( "1f3e1", ( "\xD83C\xDFE1", "house_with_garden", [ "house_with_garden" ] ) )
-- , ( "1f3e2", ( "\xD83C\xDFE2", "office", [ "office" ] ) )
-- , ( "1f3e3", ( "\xD83C\xDFE3", "post_office", [ "post_office" ] ) )
-- , ( "1f3e4"
--   , ( "\xD83C\xDFE4"
--     , "european_post_office"
--     , [ "european_post_office" ]
--     )
--   )
-- , ( "1f3e5", ( "\xD83C\xDFE5", "hospital", [ "hospital" ] ) )
-- , ( "1f3e6", ( "\xD83C\xDFE6", "bank", [ "bank" ] ) )
-- , ( "1f3e7", ( "\xD83C\xDFE7", "atm", [ "atm" ] ) )
-- , ( "1f3e8", ( "\xD83C\xDFE8", "hotel", [ "hotel" ] ) )
-- , ( "1f3e9", ( "\xD83C\xDFE9", "love_hotel", [ "love_hotel" ] ) )
-- , ( "1f3ea", ( "\xD83C\xDFEA", "convenience_store", [ "convenience_store" ] ) )
-- , ( "1f3eb", ( "\xD83C\xDFEB", "school", [ "school" ] ) )
-- , ( "1f3ec", ( "\xD83C\xDFEC", "department_store", [ "department_store" ] ) )
-- , ( "1f3ed", ( "\xD83C\xDFED", "factory", [ "factory" ] ) )
-- , ( "1f3ee"
--   , ( "\xD83C\xDFEE"
--     , "izakaya_lantern"
--     , [ "izakaya_lantern"
--       , "lantern"
--       ]
--     )
--   )
-- , ( "1f3ef", ( "\xD83C\xDFEF", "japanese_castle", [ "japanese_castle" ] ) )
-- , ( "1f3f0", ( "\xD83C\xDFF0", "european_castle", [ "european_castle" ] ) )
-- , ( "1f400", ( "\xD83D\xDC00", "rat", [ "rat" ] ) )
-- , ( "1f401", ( "\xD83D\xDC01", "mouse2", [ "mouse2" ] ) )
-- , ( "1f402", ( "\xD83D\xDC02", "ox", [ "ox" ] ) )
-- , ( "1f403", ( "\xD83D\xDC03", "water_buffalo", [ "water_buffalo" ] ) )
-- , ( "1f404", ( "\xD83D\xDC04", "cow2", [ "cow2" ] ) )
-- , ( "1f405", ( "\xD83D\xDC05", "tiger2", [ "tiger2" ] ) )
-- , ( "1f406", ( "\xD83D\xDC06", "leopard", [ "leopard" ] ) )
-- , ( "1f407", ( "\xD83D\xDC07", "rabbit2", [ "rabbit2" ] ) )
-- , ( "1f408", ( "\xD83D\xDC08", "cat2", [ "cat2" ] ) )
-- , ( "1f409", ( "\xD83D\xDC09", "dragon", [ "dragon" ] ) )
-- , ( "1f40a", ( "\xD83D\xDC0A", "crocodile", [ "crocodile" ] ) )
-- , ( "1f40b", ( "\xD83D\xDC0B", "whale2", [ "whale2" ] ) )
-- , ( "1f40c", ( "\xD83D\xDC0C", "snail", [ "snail" ] ) )
-- , ( "1f40d", ( "\xD83D\xDC0D", "snake", [ "snake" ] ) )
-- , ( "1f40e", ( "\xD83D\xDC0E", "racehorse", [ "racehorse" ] ) )
-- , ( "1f40f", ( "\xD83D\xDC0F", "ram", [ "ram" ] ) )
-- , ( "1f410", ( "\xD83D\xDC10", "goat", [ "goat" ] ) )
-- , ( "1f411", ( "\xD83D\xDC11", "sheep", [ "sheep" ] ) )
-- , ( "1f412", ( "\xD83D\xDC12", "monkey", [ "monkey" ] ) )
-- , ( "1f413", ( "\xD83D\xDC13", "rooster", [ "rooster" ] ) )
-- , ( "1f414", ( "\xD83D\xDC14", "chicken", [ "chicken" ] ) )
-- , ( "1f415", ( "\xD83D\xDC15", "dog2", [ "dog2" ] ) )
-- , ( "1f416", ( "\xD83D\xDC16", "pig2", [ "pig2" ] ) )
-- , ( "1f417", ( "\xD83D\xDC17", "boar", [ "boar" ] ) )
-- , ( "1f418", ( "\xD83D\xDC18", "elephant", [ "elephant" ] ) )
-- , ( "1f419", ( "\xD83D\xDC19", "octopus", [ "octopus" ] ) )
-- , ( "1f41a", ( "\xD83D\xDC1A", "shell", [ "shell" ] ) )
-- , ( "1f41b", ( "\xD83D\xDC1B", "bug", [ "bug" ] ) )
-- , ( "1f41c", ( "\xD83D\xDC1C", "ant", [ "ant" ] ) )
-- , ( "1f41d", ( "\xD83D\xDC1D", "bee", [ "bee", "honeybee" ] ) )
-- , ( "1f41e", ( "\xD83D\xDC1E", "beetle", [ "beetle" ] ) )
-- , ( "1f41f", ( "\xD83D\xDC1F", "fish", [ "fish" ] ) )
-- , ( "1f420", ( "\xD83D\xDC20", "tropical_fish", [ "tropical_fish" ] ) )
-- , ( "1f421", ( "\xD83D\xDC21", "blowfish", [ "blowfish" ] ) )
-- , ( "1f422", ( "\xD83D\xDC22", "turtle", [ "turtle" ] ) )
-- , ( "1f423", ( "\xD83D\xDC23", "hatching_chick", [ "hatching_chick" ] ) )
-- , ( "1f424", ( "\xD83D\xDC24", "baby_chick", [ "baby_chick" ] ) )
-- , ( "1f425", ( "\xD83D\xDC25", "hatched_chick", [ "hatched_chick" ] ) )
-- , ( "1f426", ( "\xD83D\xDC26", "bird", [ "bird" ] ) )
-- , ( "1f427", ( "\xD83D\xDC27", "penguin", [ "penguin" ] ) )
-- , ( "1f428", ( "\xD83D\xDC28", "koala", [ "koala" ] ) )
-- , ( "1f429", ( "\xD83D\xDC29", "poodle", [ "poodle" ] ) )
-- , ( "1f42a", ( "\xD83D\xDC2A", "dromedary_camel", [ "dromedary_camel" ] ) )
-- , ( "1f42b", ( "\xD83D\xDC2B", "camel", [ "camel" ] ) )
-- , ( "1f42c", ( "\xD83D\xDC2C", "dolphin", [ "dolphin", "flipper" ] ) )
-- , ( "1f42d", ( "\xD83D\xDC2D", "mouse", [ "mouse" ] ) )
-- , ( "1f42e", ( "\xD83D\xDC2E", "cow", [ "cow" ] ) )
-- , ( "1f42f", ( "\xD83D\xDC2F", "tiger", [ "tiger" ] ) )
-- , ( "1f430", ( "\xD83D\xDC30", "rabbit", [ "rabbit" ] ) )
-- , ( "1f431", ( "\xD83D\xDC31", "cat", [ "cat" ] ) )
-- , ( "1f432", ( "\xD83D\xDC32", "dragon_face", [ "dragon_face" ] ) )
-- , ( "1f433", ( "\xD83D\xDC33", "whale", [ "whale" ] ) )
-- , ( "1f434", ( "\xD83D\xDC34", "horse", [ "horse" ] ) )
-- , ( "1f435", ( "\xD83D\xDC35", "monkey_face", [ "monkey_face" ] ) )
-- , ( "1f436", ( "\xD83D\xDC36", "dog", [ "dog" ] ) )
-- , ( "1f437", ( "\xD83D\xDC37", "pig", [ "pig" ] ) )
-- , ( "1f438", ( "\xD83D\xDC38", "frog", [ "frog" ] ) )
-- , ( "1f439", ( "\xD83D\xDC39", "hamster", [ "hamster" ] ) )
-- , ( "1f43a", ( "\xD83D\xDC3A", "wolf", [ "wolf" ] ) )
-- , ( "1f43b", ( "\xD83D\xDC3B", "bear", [ "bear" ] ) )
-- , ( "1f43c", ( "\xD83D\xDC3C", "panda_face", [ "panda_face" ] ) )
-- , ( "1f43d", ( "\xD83D\xDC3D", "pig_nose", [ "pig_nose" ] ) )
-- , ( "1f43e", ( "\xD83D\xDC3E", "feet", [ "feet", "paw_prints" ] ) )
-- , ( "1f440", ( "\xD83D\xDC40", "eyes", [ "eyes" ] ) )
-- , ( "1f442", ( "\xD83D\xDC42", "ear", [ "ear" ] ) )
-- , ( "1f443", ( "\xD83D\xDC43", "nose", [ "nose" ] ) )
-- , ( "1f444", ( "\xD83D\xDC44", "lips", [ "lips" ] ) )
-- , ( "1f445", ( "\xD83D\xDC45", "tongue", [ "tongue" ] ) )
-- , ( "1f446", ( "\xD83D\xDC46", "point_up_2", [ "point_up_2" ] ) )
-- , ( "1f447", ( "\xD83D\xDC47", "point_down", [ "point_down" ] ) )
-- , ( "1f448", ( "\xD83D\xDC48", "point_left", [ "point_left" ] ) )
-- , ( "1f449", ( "\xD83D\xDC49", "point_right", [ "point_right" ] ) )
-- , ( "1f44a", ( "\xD83D\xDC4A", "facepunch", [ "facepunch", "punch" ] ) )
-- , ( "1f44b", ( "\xD83D\xDC4B", "wave", [ "wave" ] ) )
-- , ( "1f44c", ( "\xD83D\xDC4C", "ok_hand", [ "ok_hand" ] ) )
-- , ( "1f44d", ( "\xD83D\xDC4D", "+1", [ "+1", "thumbsup" ] ) )
-- , ( "1f44e", ( "\xD83D\xDC4E", "-1", [ "-1", "thumbsdown" ] ) )
-- , ( "1f44f", ( "\xD83D\xDC4F", "clap", [ "clap" ] ) )
-- , ( "1f450", ( "\xD83D\xDC50", "open_hands", [ "open_hands" ] ) )
-- , ( "1f451", ( "\xD83D\xDC51", "crown", [ "crown" ] ) )
-- , ( "1f452", ( "\xD83D\xDC52", "womans_hat", [ "womans_hat" ] ) )
-- , ( "1f453", ( "\xD83D\xDC53", "eyeglasses", [ "eyeglasses" ] ) )
-- , ( "1f454", ( "\xD83D\xDC54", "necktie", [ "necktie" ] ) )
-- , ( "1f455", ( "\xD83D\xDC55", "shirt", [ "shirt", "tshirt" ] ) )
-- , ( "1f456", ( "\xD83D\xDC56", "jeans", [ "jeans" ] ) )
-- , ( "1f457", ( "\xD83D\xDC57", "dress", [ "dress" ] ) )
-- , ( "1f458", ( "\xD83D\xDC58", "kimono", [ "kimono" ] ) )
-- , ( "1f459", ( "\xD83D\xDC59", "bikini", [ "bikini" ] ) )
-- , ( "1f45a", ( "\xD83D\xDC5A", "womans_clothes", [ "womans_clothes" ] ) )
-- , ( "1f45b", ( "\xD83D\xDC5B", "purse", [ "purse" ] ) )
-- , ( "1f45c", ( "\xD83D\xDC5C", "handbag", [ "handbag" ] ) )
-- , ( "1f45d", ( "\xD83D\xDC5D", "pouch", [ "pouch" ] ) )
-- , ( "1f45e", ( "\xD83D\xDC5E", "mans_shoe", [ "mans_shoe", "shoe" ] ) )
-- , ( "1f45f", ( "\xD83D\xDC5F", "athletic_shoe", [ "athletic_shoe" ] ) )
-- , ( "1f460", ( "\xD83D\xDC60", "high_heel", [ "high_heel" ] ) )
-- , ( "1f461", ( "\xD83D\xDC61", "sandal", [ "sandal" ] ) )
-- , ( "1f462", ( "\xD83D\xDC62", "boot", [ "boot" ] ) )
-- , ( "1f463", ( "\xD83D\xDC63", "footprints", [ "footprints" ] ) )
-- , ( "1f464", ( "\xD83D\xDC64", "bust_in_silhouette", [ "bust_in_silhouette" ] ) )
-- , ( "1f465"
--   , ( "\xD83D\xDC65"
--     , "busts_in_silhouette"
--     , [ "busts_in_silhouette" ]
--     )
--   )
-- , ( "1f466", ( "\xD83D\xDC66", "boy", [ "boy" ] ) )
-- , ( "1f467", ( "\xD83D\xDC67", "girl", [ "girl" ] ) )
-- , ( "1f468", ( "\xD83D\xDC68", "man", [ "man" ] ) )
-- , ( "1f469", ( "\xD83D\xDC69", "woman", [ "woman" ] ) )
-- , ( "1f46a", ( "\xD83D\xDC6A", "family", [ "family" ] ) )
-- , ( "1f46b", ( "\xD83D\xDC6B", "couple", [ "couple" ] ) )
-- , ( "1f46c"
--   , ( "\xD83D\xDC6C"
--     , "two_men_holding_hands"
--     , [ "two_men_holding_hands" ]
--     )
--   )
-- , ( "1f46d"
--   , ( "\xD83D\xDC6D"
--     , "two_women_holding_hands"
--     , [ "two_women_holding_hands" ]
--     )
--   )
-- , ( "1f46e", ( "\xD83D\xDC6E", "cop", [ "cop" ] ) )
-- , ( "1f46f", ( "\xD83D\xDC6F", "dancers", [ "dancers" ] ) )
-- , ( "1f470", ( "\xD83D\xDC70", "bride_with_veil", [ "bride_with_veil" ] ) )
-- , ( "1f471"
--   , ( "\xD83D\xDC71"
--     , "person_with_blond_hair"
--     , [ "person_with_blond_hair" ]
--     )
--   )
-- , ( "1f472"
--   , ( "\xD83D\xDC72"
--     , "man_with_gua_pi_mao"
--     , [ "man_with_gua_pi_mao" ]
--     )
--   )
-- , ( "1f473", ( "\xD83D\xDC73", "man_with_turban", [ "man_with_turban" ] ) )
-- , ( "1f474", ( "\xD83D\xDC74", "older_man", [ "older_man" ] ) )
-- , ( "1f475", ( "\xD83D\xDC75", "older_woman", [ "older_woman" ] ) )
-- , ( "1f476", ( "\xD83D\xDC76", "baby", [ "baby" ] ) )
-- , ( "1f477"
--   , ( "\xD83D\xDC77"
--     , "construction_worker"
--     , [ "construction_worker" ]
--     )
--   )
-- , ( "1f478", ( "\xD83D\xDC78", "princess", [ "princess" ] ) )
-- , ( "1f479", ( "\xD83D\xDC79", "japanese_ogre", [ "japanese_ogre" ] ) )
-- , ( "1f47a", ( "\xD83D\xDC7A", "japanese_goblin", [ "japanese_goblin" ] ) )
-- , ( "1f47b", ( "\xD83D\xDC7B", "ghost", [ "ghost" ] ) )
-- , ( "1f47c", ( "\xD83D\xDC7C", "angel", [ "angel" ] ) )
-- , ( "1f47d", ( "\xD83D\xDC7D", "alien", [ "alien" ] ) )
-- , ( "1f47e", ( "\xD83D\xDC7E", "space_invader", [ "space_invader" ] ) )
-- , ( "1f47f", ( "\xD83D\xDC7F", "imp", [ "imp" ] ) )
-- , ( "1f480", ( "\xD83D\xDC80", "skull", [ "skull" ] ) )
-- , ( "1f481"
--   , ( "\xD83D\xDC81"
--     , "information_desk_person"
--     , [ "information_desk_person" ]
--     )
--   )
-- , ( "1f482", ( "\xD83D\xDC82", "guardsman", [ "guardsman" ] ) )
-- , ( "1f483", ( "\xD83D\xDC83", "dancer", [ "dancer" ] ) )
-- , ( "1f484", ( "\xD83D\xDC84", "lipstick", [ "lipstick" ] ) )
-- , ( "1f485", ( "\xD83D\xDC85", "nail_care", [ "nail_care" ] ) )
-- , ( "1f486", ( "\xD83D\xDC86", "massage", [ "massage" ] ) )
-- , ( "1f487", ( "\xD83D\xDC87", "haircut", [ "haircut" ] ) )
-- , ( "1f488", ( "\xD83D\xDC88", "barber", [ "barber" ] ) )
-- , ( "1f489", ( "\xD83D\xDC89", "syringe", [ "syringe" ] ) )
-- , ( "1f48a", ( "\xD83D\xDC8A", "pill", [ "pill" ] ) )
-- , ( "1f48b", ( "\xD83D\xDC8B", "kiss", [ "kiss" ] ) )
-- , ( "1f48c", ( "\xD83D\xDC8C", "love_letter", [ "love_letter" ] ) )
-- , ( "1f48d", ( "\xD83D\xDC8D", "ring", [ "ring" ] ) )
-- , ( "1f48e", ( "\xD83D\xDC8E", "gem", [ "gem" ] ) )
-- , ( "1f48f", ( "\xD83D\xDC8F", "couplekiss", [ "couplekiss" ] ) )
-- , ( "1f490", ( "\xD83D\xDC90", "bouquet", [ "bouquet" ] ) )
-- , ( "1f491", ( "\xD83D\xDC91", "couple_with_heart", [ "couple_with_heart" ] ) )
-- , ( "1f492", ( "\xD83D\xDC92", "wedding", [ "wedding" ] ) )
-- , ( "1f493", ( "\xD83D\xDC93", "heartbeat", [ "heartbeat" ] ) )
-- , ( "1f494", ( "\xD83D\xDC94", "broken_heart", [ "broken_heart" ] ) )
-- , ( "1f495", ( "\xD83D\xDC95", "two_hearts", [ "two_hearts" ] ) )
-- , ( "1f496", ( "\xD83D\xDC96", "sparkling_heart", [ "sparkling_heart" ] ) )
-- , ( "1f497", ( "\xD83D\xDC97", "heartpulse", [ "heartpulse" ] ) )
-- , ( "1f498", ( "\xD83D\xDC98", "cupid", [ "cupid" ] ) )
-- , ( "1f499", ( "\xD83D\xDC99", "blue_heart", [ "blue_heart" ] ) )
-- , ( "1f49a", ( "\xD83D\xDC9A", "green_heart", [ "green_heart" ] ) )
-- , ( "1f49b", ( "\xD83D\xDC9B", "yellow_heart", [ "yellow_heart" ] ) )
-- , ( "1f49c", ( "\xD83D\xDC9C", "purple_heart", [ "purple_heart" ] ) )
-- , ( "1f49d", ( "\xD83D\xDC9D", "gift_heart", [ "gift_heart" ] ) )
-- , ( "1f49e", ( "\xD83D\xDC9E", "revolving_hearts", [ "revolving_hearts" ] ) )
-- , ( "1f49f", ( "\xD83D\xDC9F", "heart_decoration", [ "heart_decoration" ] ) )
-- , ( "1f4a0"
--   , ( "\xD83D\xDCA0"
--     , "diamond_shape_with_a_dot_inside"
--     , [ "diamond_shape_with_a_dot_inside" ]
--     )
--   )
-- , ( "1f4a1", ( "\xD83D\xDCA1", "bulb", [ "bulb" ] ) )
-- , ( "1f4a2", ( "\xD83D\xDCA2", "anger", [ "anger" ] ) )
-- , ( "1f4a3", ( "\xD83D\xDCA3", "bomb", [ "bomb" ] ) )
-- , ( "1f4a4", ( "\xD83D\xDCA4", "zzz", [ "zzz" ] ) )
-- , ( "1f4a5", ( "\xD83D\xDCA5", "boom", [ "boom", "collision" ] ) )
-- , ( "1f4a6", ( "\xD83D\xDCA6", "sweat_drops", [ "sweat_drops" ] ) )
-- , ( "1f4a7", ( "\xD83D\xDCA7", "droplet", [ "droplet" ] ) )
-- , ( "1f4a8", ( "\xD83D\xDCA8", "dash", [ "dash" ] ) )
-- , ( "1f4a9", ( "\xD83D\xDCA9", "hankey", [ "hankey", "poop", "shit" ] ) )
-- , ( "1f4aa", ( "\xD83D\xDCAA", "muscle", [ "muscle" ] ) )
-- , ( "1f4ab", ( "\xD83D\xDCAB", "dizzy", [ "dizzy" ] ) )
-- , ( "1f4ac", ( "\xD83D\xDCAC", "speech_balloon", [ "speech_balloon" ] ) )
-- , ( "1f4ad", ( "\xD83D\xDCAD", "thought_balloon", [ "thought_balloon" ] ) )
-- , ( "1f4ae", ( "\xD83D\xDCAE", "white_flower", [ "white_flower" ] ) )
-- , ( "1f4af", ( "\xD83D\xDCAF", "100", [ "100" ] ) )
-- , ( "1f4b0", ( "\xD83D\xDCB0", "moneybag", [ "moneybag" ] ) )
-- , ( "1f4b1", ( "\xD83D\xDCB1", "currency_exchange", [ "currency_exchange" ] ) )
-- , ( "1f4b2", ( "\xD83D\xDCB2", "heavy_dollar_sign", [ "heavy_dollar_sign" ] ) )
-- , ( "1f4b3", ( "\xD83D\xDCB3", "credit_card", [ "credit_card" ] ) )
-- , ( "1f4b4", ( "\xD83D\xDCB4", "yen", [ "yen" ] ) )
-- , ( "1f4b5", ( "\xD83D\xDCB5", "dollar", [ "dollar" ] ) )
-- , ( "1f4b6", ( "\xD83D\xDCB6", "euro", [ "euro" ] ) )
-- , ( "1f4b7", ( "\xD83D\xDCB7", "pound", [ "pound" ] ) )
-- , ( "1f4b8", ( "\xD83D\xDCB8", "money_with_wings", [ "money_with_wings" ] ) )
-- , ( "1f4b9", ( "\xD83D\xDCB9", "chart", [ "chart" ] ) )
-- , ( "1f4ba", ( "\xD83D\xDCBA", "seat", [ "seat" ] ) )
-- , ( "1f4bb", ( "\xD83D\xDCBB", "computer", [ "computer" ] ) )
-- , ( "1f4bc", ( "\xD83D\xDCBC", "briefcase", [ "briefcase" ] ) )
-- , ( "1f4bd", ( "\xD83D\xDCBD", "minidisc", [ "minidisc" ] ) )
-- , ( "1f4be", ( "\xD83D\xDCBE", "floppy_disk", [ "floppy_disk" ] ) )
-- , ( "1f4bf", ( "\xD83D\xDCBF", "cd", [ "cd" ] ) )
-- , ( "1f4c0", ( "\xD83D\xDCC0", "dvd", [ "dvd" ] ) )
-- , ( "1f4c1", ( "\xD83D\xDCC1", "file_folder", [ "file_folder" ] ) )
-- , ( "1f4c2", ( "\xD83D\xDCC2", "open_file_folder", [ "open_file_folder" ] ) )
-- , ( "1f4c3", ( "\xD83D\xDCC3", "page_with_curl", [ "page_with_curl" ] ) )
-- , ( "1f4c4", ( "\xD83D\xDCC4", "page_facing_up", [ "page_facing_up" ] ) )
-- , ( "1f4c5", ( "\xD83D\xDCC5", "date", [ "date" ] ) )
-- , ( "1f4c6", ( "\xD83D\xDCC6", "calendar", [ "calendar" ] ) )
-- , ( "1f4c7", ( "\xD83D\xDCC7", "card_index", [ "card_index" ] ) )
-- , ( "1f4c8"
--   , ( "\xD83D\xDCC8"
--     , "chart_with_upwards_trend"
--     , [ "chart_with_upwards_trend" ]
--     )
--   )
-- , ( "1f4c9"
--   , ( "\xD83D\xDCC9"
--     , "chart_with_downwards_trend"
--     , [ "chart_with_downwards_trend" ]
--     )
--   )
-- , ( "1f4ca", ( "\xD83D\xDCCA", "bar_chart", [ "bar_chart" ] ) )
-- , ( "1f4cb", ( "\xD83D\xDCCB", "clipboard", [ "clipboard" ] ) )
-- , ( "1f4cc", ( "\xD83D\xDCCC", "pushpin", [ "pushpin" ] ) )
-- , ( "1f4cd", ( "\xD83D\xDCCD", "round_pushpin", [ "round_pushpin" ] ) )
-- , ( "1f4ce", ( "\xD83D\xDCCE", "paperclip", [ "paperclip" ] ) )
-- , ( "1f4cf", ( "\xD83D\xDCCF", "straight_ruler", [ "straight_ruler" ] ) )
-- , ( "1f4d0", ( "\xD83D\xDCD0", "triangular_ruler", [ "triangular_ruler" ] ) )
-- , ( "1f4d1", ( "\xD83D\xDCD1", "bookmark_tabs", [ "bookmark_tabs" ] ) )
-- , ( "1f4d2", ( "\xD83D\xDCD2", "ledger", [ "ledger" ] ) )
-- , ( "1f4d3", ( "\xD83D\xDCD3", "notebook", [ "notebook" ] ) )
-- , ( "1f4d4"
--   , ( "\xD83D\xDCD4"
--     , "notebook_with_decorative_cover"
--     , [ "notebook_with_decorative_cover" ]
--     )
--   )
-- , ( "1f4d5", ( "\xD83D\xDCD5", "closed_book", [ "closed_book" ] ) )
-- , ( "1f4d6", ( "\xD83D\xDCD6", "book", [ "book", "open_book" ] ) )
-- , ( "1f4d7", ( "\xD83D\xDCD7", "green_book", [ "green_book" ] ) )
-- , ( "1f4d8", ( "\xD83D\xDCD8", "blue_book", [ "blue_book" ] ) )
-- , ( "1f4d9", ( "\xD83D\xDCD9", "orange_book", [ "orange_book" ] ) )
-- , ( "1f4da", ( "\xD83D\xDCDA", "books", [ "books" ] ) )
-- , ( "1f4db", ( "\xD83D\xDCDB", "name_badge", [ "name_badge" ] ) )
-- , ( "1f4dc", ( "\xD83D\xDCDC", "scroll", [ "scroll" ] ) )
-- , ( "1f4dd", ( "\xD83D\xDCDD", "memo", [ "memo", "pencil" ] ) )
-- , ( "1f4de", ( "\xD83D\xDCDE", "telephone_receiver", [ "telephone_receiver" ] ) )
-- , ( "1f4df", ( "\xD83D\xDCDF", "pager", [ "pager" ] ) )
-- , ( "1f4e0", ( "\xD83D\xDCE0", "fax", [ "fax" ] ) )
-- , ( "1f4e1", ( "\xD83D\xDCE1", "satellite", [ "satellite" ] ) )
-- , ( "1f4e2", ( "\xD83D\xDCE2", "loudspeaker", [ "loudspeaker" ] ) )
-- , ( "1f4e3", ( "\xD83D\xDCE3", "mega", [ "mega" ] ) )
-- , ( "1f4e4", ( "\xD83D\xDCE4", "outbox_tray", [ "outbox_tray" ] ) )
-- , ( "1f4e5", ( "\xD83D\xDCE5", "inbox_tray", [ "inbox_tray" ] ) )
-- , ( "1f4e6", ( "\xD83D\xDCE6", "package", [ "package" ] ) )
-- , ( "1f4e7", ( "\xD83D\xDCE7", "e-mail", [ "e-mail" ] ) )
-- , ( "1f4e8", ( "\xD83D\xDCE8", "incoming_envelope", [ "incoming_envelope" ] ) )
-- , ( "1f4e9"
--   , ( "\xD83D\xDCE9"
--     , "envelope_with_arrow"
--     , [ "envelope_with_arrow" ]
--     )
--   )
-- , ( "1f4ea", ( "\xD83D\xDCEA", "mailbox_closed", [ "mailbox_closed" ] ) )
-- , ( "1f4eb", ( "\xD83D\xDCEB", "mailbox", [ "mailbox" ] ) )
-- , ( "1f4ec", ( "\xD83D\xDCEC", "mailbox_with_mail", [ "mailbox_with_mail" ] ) )
-- , ( "1f4ed"
--   , ( "\xD83D\xDCED"
--     , "mailbox_with_no_mail"
--     , [ "mailbox_with_no_mail" ]
--     )
--   )
-- , ( "1f4ee", ( "\xD83D\xDCEE", "postbox", [ "postbox" ] ) )
-- , ( "1f4ef", ( "\xD83D\xDCEF", "postal_horn", [ "postal_horn" ] ) )
-- , ( "1f4f0", ( "\xD83D\xDCF0", "newspaper", [ "newspaper" ] ) )
-- , ( "1f4f1", ( "\xD83D\xDCF1", "iphone", [ "iphone" ] ) )
-- , ( "1f4f2", ( "\xD83D\xDCF2", "calling", [ "calling" ] ) )
-- , ( "1f4f3", ( "\xD83D\xDCF3", "vibration_mode", [ "vibration_mode" ] ) )
-- , ( "1f4f4", ( "\xD83D\xDCF4", "mobile_phone_off", [ "mobile_phone_off" ] ) )
-- , ( "1f4f5", ( "\xD83D\xDCF5", "no_mobile_phones", [ "no_mobile_phones" ] ) )
-- , ( "1f4f6", ( "\xD83D\xDCF6", "signal_strength", [ "signal_strength" ] ) )
-- , ( "1f4f7", ( "\xD83D\xDCF7", "camera", [ "camera" ] ) )
-- , ( "1f4f9", ( "\xD83D\xDCF9", "video_camera", [ "video_camera" ] ) )
-- , ( "1f4fa", ( "\xD83D\xDCFA", "tv", [ "tv" ] ) )
-- , ( "1f4fb", ( "\xD83D\xDCFB", "radio", [ "radio" ] ) )
-- , ( "1f4fc", ( "\xD83D\xDCFC", "vhs", [ "vhs" ] ) )
-- , ( "1f500"
--   , ( "\xD83D\xDD00"
--     , "twisted_rightwards_arrows"
--     , [ "twisted_rightwards_arrows" ]
--     )
--   )
-- , ( "1f501", ( "\xD83D\xDD01", "repeat", [ "repeat" ] ) )
-- , ( "1f502", ( "\xD83D\xDD02", "repeat_one", [ "repeat_one" ] ) )
-- , ( "1f503", ( "\xD83D\xDD03", "arrows_clockwise", [ "arrows_clockwise" ] ) )
-- , ( "1f504"
--   , ( "\xD83D\xDD04"
--     , "arrows_counterclockwise"
--     , [ "arrows_counterclockwise" ]
--     )
--   )
-- , ( "1f505", ( "\xD83D\xDD05", "low_brightness", [ "low_brightness" ] ) )
-- , ( "1f506", ( "\xD83D\xDD06", "high_brightness", [ "high_brightness" ] ) )
-- , ( "1f507", ( "\xD83D\xDD07", "mute", [ "mute" ] ) )
-- , ( "1f508", ( "\xD83D\xDD09", "speaker", [ "speaker" ] ) )
-- , ( "1f509", ( "\xD83D\xDD09", "sound", [ "sound" ] ) )
-- , ( "1f50a", ( "\xD83D\xDD0A", "loud_sound", [ "loud_sound" ] ) )
-- , ( "1f50b", ( "\xD83D\xDD0B", "battery", [ "battery" ] ) )
-- , ( "1f50c", ( "\xD83D\xDD0C", "electric_plug", [ "electric_plug" ] ) )
-- , ( "1f50d", ( "\xD83D\xDD0D", "mag", [ "mag" ] ) )
-- , ( "1f50e", ( "\xD83D\xDD0E", "mag_right", [ "mag_right" ] ) )
-- , ( "1f50f", ( "\xD83D\xDD0F", "lock_with_ink_pen", [ "lock_with_ink_pen" ] ) )
-- , ( "1f510"
--   , ( "\xD83D\xDD10"
--     , "closed_lock_with_key"
--     , [ "closed_lock_with_key" ]
--     )
--   )
-- , ( "1f511", ( "\xD83D\xDD11", "key", [ "key" ] ) )
-- , ( "1f512", ( "\xD83D\xDD12", "lock", [ "lock" ] ) )
-- , ( "1f513", ( "\xD83D\xDD13", "unlock", [ "unlock" ] ) )
-- , ( "1f514", ( "\xD83D\xDD14", "bell", [ "bell" ] ) )
-- , ( "1f515", ( "\xD83D\xDD15", "no_bell", [ "no_bell" ] ) )
-- , ( "1f516", ( "\xD83D\xDD16", "bookmark", [ "bookmark" ] ) )
-- , ( "1f517", ( "\xD83D\xDD17", "link", [ "link" ] ) )
-- , ( "1f518", ( "\xD83D\xDD18", "radio_button", [ "radio_button" ] ) )
-- , ( "1f519", ( "\xD83D\xDD19", "back", [ "back" ] ) )
-- , ( "1f51a", ( "\xD83D\xDD1A", "end", [ "end" ] ) )
-- , ( "1f51b", ( "\xD83D\xDD1B", "on", [ "on" ] ) )
-- , ( "1f51c", ( "\xD83D\xDD1C", "soon", [ "soon" ] ) )
-- , ( "1f51d", ( "\xD83D\xDD1D", "top", [ "top" ] ) )
-- , ( "1f51e", ( "\xD83D\xDD1E", "underage", [ "underage" ] ) )
-- , ( "1f51f", ( "\xD83D\xDD1F", "keycap_ten", [ "keycap_ten" ] ) )
-- , ( "1f520", ( "\xD83D\xDD20", "capital_abcd", [ "capital_abcd" ] ) )
-- , ( "1f521", ( "\xD83D\xDD21", "abcd", [ "abcd" ] ) )
-- , ( "1f522", ( "\xD83D\xDD22", "1234", [ "1234" ] ) )
-- , ( "1f523", ( "\xD83D\xDD23", "symbols", [ "symbols" ] ) )
-- , ( "1f524", ( "\xD83D\xDD24", "abc", [ "abc" ] ) )
-- , ( "1f525", ( "\xD83D\xDD25", "fire", [ "fire" ] ) )
-- , ( "1f526", ( "\xD83D\xDD26", "flashlight", [ "flashlight" ] ) )
-- , ( "1f527", ( "\xD83D\xDD27", "wrench", [ "wrench" ] ) )
-- , ( "1f528", ( "\xD83D\xDD28", "hammer", [ "hammer" ] ) )
-- , ( "1f529", ( "\xD83D\xDD29", "nut_and_bolt", [ "nut_and_bolt" ] ) )
-- , ( "1f52a", ( "\xD83D\xDD2A", "hocho", [ "hocho" ] ) )
-- , ( "1f52b", ( "\xD83D\xDD2B", "gun", [ "gun" ] ) )
-- , ( "1f52c", ( "\xD83D\xDD2C", "microscope", [ "microscope" ] ) )
-- , ( "1f52d", ( "\xD83D\xDD2D", "telescope", [ "telescope" ] ) )
-- , ( "1f52e", ( "\xD83D\xDD2E", "crystal_ball", [ "crystal_ball" ] ) )
-- , ( "1f52f", ( "\xD83D\xDD2F", "six_pointed_star", [ "six_pointed_star" ] ) )
-- , ( "1f530", ( "\xD83D\xDD30", "beginner", [ "beginner" ] ) )
-- , ( "1f531", ( "\xD83D\xDD31", "trident", [ "trident" ] ) )
-- , ( "1f532"
--   , ( "\xD83D\xDD32"
--     , "black_square_button"
--     , [ "black_square_button" ]
--     )
--   )
-- , ( "1f533"
--   , ( "\xD83D\xDD33"
--     , "white_square_button"
--     , [ "white_square_button" ]
--     )
--   )
-- , ( "1f534", ( "\xD83D\xDD34", "red_circle", [ "red_circle" ] ) )
-- , ( "1f535", ( "\xD83D\xDD35", "large_blue_circle", [ "large_blue_circle" ] ) )
-- , ( "1f536"
--   , ( "\xD83D\xDD36"
--     , "large_orange_diamond"
--     , [ "large_orange_diamond" ]
--     )
--   )
-- , ( "1f537", ( "\xD83D\xDD37", "large_blue_diamond", [ "large_blue_diamond" ] ) )
-- , ( "1f538"
--   , ( "\xD83D\xDD38"
--     , "small_orange_diamond"
--     , [ "small_orange_diamond" ]
--     )
--   )
-- , ( "1f539", ( "\xD83D\xDD39", "small_blue_diamond", [ "small_blue_diamond" ] ) )
-- , ( "1f53a", ( "\xD83D\xDD3A", "small_red_triangle", [ "small_red_triangle" ] ) )
-- , ( "1f53b"
--   , ( "\xD83D\xDD3B"
--     , "small_red_triangle_down"
--     , [ "small_red_triangle_down" ]
--     )
--   )
-- , ( "1f53c", ( "\xD83D\xDD3C", "arrow_up_small", [ "arrow_up_small" ] ) )
-- , ( "1f53d", ( "\xD83D\xDD3D", "arrow_down_small", [ "arrow_down_small" ] ) )
-- , ( "1f550", ( "\xD83D\xDD50", "clock1", [ "clock1" ] ) )
-- , ( "1f551", ( "\xD83D\xDD51", "clock2", [ "clock2" ] ) )
-- , ( "1f552", ( "\xD83D\xDD52", "clock3", [ "clock3" ] ) )
-- , ( "1f553", ( "\xD83D\xDD53", "clock4", [ "clock4" ] ) )
-- , ( "1f554", ( "\xD83D\xDD54", "clock5", [ "clock5" ] ) )
-- , ( "1f555", ( "\xD83D\xDD55", "clock6", [ "clock6" ] ) )
-- , ( "1f556", ( "\xD83D\xDD56", "clock7", [ "clock7" ] ) )
-- , ( "1f557", ( "\xD83D\xDD57", "clock8", [ "clock8" ] ) )
-- , ( "1f558", ( "\xD83D\xDD58", "clock9", [ "clock9" ] ) )
-- , ( "1f559", ( "\xD83D\xDD59", "clock10", [ "clock10" ] ) )
-- , ( "1f55a", ( "\xD83D\xDD5A", "clock11", [ "clock11" ] ) )
-- , ( "1f55b", ( "\xD83D\xDD5B", "clock12", [ "clock12" ] ) )
-- , ( "1f55c", ( "\xD83D\xDD5C", "clock130", [ "clock130" ] ) )
-- , ( "1f55d", ( "\xD83D\xDD5D", "clock230", [ "clock230" ] ) )
-- , ( "1f55e", ( "\xD83D\xDD5E", "clock330", [ "clock330" ] ) )
-- , ( "1f55f", ( "\xD83D\xDD5F", "clock430", [ "clock430" ] ) )
-- , ( "1f560", ( "\xD83D\xDD60", "clock530", [ "clock530" ] ) )
-- , ( "1f561", ( "\xD83D\xDD61", "clock630", [ "clock630" ] ) )
-- , ( "1f562", ( "\xD83D\xDD62", "clock730", [ "clock730" ] ) )
-- , ( "1f563", ( "\xD83D\xDD63", "clock830", [ "clock830" ] ) )
-- , ( "1f564", ( "\xD83D\xDD64", "clock930", [ "clock930" ] ) )
-- , ( "1f565", ( "\xD83D\xDD65", "clock1030", [ "clock1030" ] ) )
-- , ( "1f566", ( "\xD83D\xDD66", "clock1130", [ "clock1130" ] ) )
-- , ( "1f567", ( "\xD83D\xDD67", "clock1230", [ "clock1230" ] ) )
-- , ( "1f5fb", ( "\xD83D\xDDFB", "mount_fuji", [ "mount_fuji" ] ) )
-- , ( "1f5fc", ( "\xD83D\xDDFC", "tokyo_tower", [ "tokyo_tower" ] ) )
-- , ( "1f5fd", ( "\xD83D\xDDFD", "statue_of_liberty", [ "statue_of_liberty" ] ) )
-- , ( "1f5fe", ( "\xD83D\xDDFE", "japan", [ "japan" ] ) )
-- , ( "1f5ff", ( "\xD83D\xDDFF", "moyai", [ "moyai" ] ) )
-- , ( "1f600", ( "\xD83D\xDE00", "grinning", [ "grinning" ] ) )
-- , ( "1f601", ( "\xD83D\xDE01", "grin", [ "grin" ] ) )
-- , ( "1f602", ( "\xD83D\xDE02", "joy", [ "joy" ] ) )
-- , ( "1f603", ( "\xD83D\xDE03", "smiley", [ "smiley" ] ) )
-- , ( "1f604", ( "\xD83D\xDE04", "smile", [ "smile" ] ) )
-- , ( "1f605", ( "\xD83D\xDE05", "sweat_smile", [ "sweat_smile" ] ) )
-- , ( "1f606", ( "\xD83D\xDE06", "satisfied", [ "satisfied" ] ) )
-- , ( "1f607", ( "\xD83D\xDE07", "innocent", [ "innocent" ] ) )
-- , ( "1f608", ( "\xD83D\xDE08", "smiling_imp", [ "smiling_imp" ] ) )
-- , ( "1f609", ( "\xD83D\xDE09", "wink", [ "wink" ] ) )
-- , ( "1f60a", ( "\xD83D\xDE0A", "blush", [ "blush" ] ) )
-- , ( "1f60b", ( "\xD83D\xDE0B", "yum", [ "yum" ] ) )
-- , ( "1f60c", ( "\xD83D\xDE0C", "relieved", [ "relieved" ] ) )
-- , ( "1f60d", ( "\xD83D\xDE0D", "heart_eyes", [ "heart_eyes" ] ) )
-- , ( "1f60e", ( "\xD83D\xDE0E", "sunglasses", [ "sunglasses" ] ) )
-- , ( "1f60f", ( "\xD83D\xDE0F", "smirk", [ "smirk" ] ) )
-- , ( "1f610", ( "\xD83D\xDE10", "neutral_face", [ "neutral_face" ] ) )
-- , ( "1f611", ( "\xD83D\xDE11", "expressionless", [ "expressionless" ] ) )
-- , ( "1f612", ( "\xD83D\xDE12", "unamused", [ "unamused" ] ) )
-- , ( "1f613", ( "\xD83D\xDE13", "sweat", [ "sweat" ] ) )
-- , ( "1f614", ( "\xD83D\xDE14", "pensive", [ "pensive" ] ) )
-- , ( "1f615", ( "\xD83D\xDE15", "confused", [ "confused" ] ) )
-- , ( "1f616", ( "\xD83D\xDE16", "confounded", [ "confounded" ] ) )
-- , ( "1f617", ( "\xD83D\xDE17", "kissing", [ "kissing" ] ) )
-- , ( "1f618", ( "\xD83D\xDE18", "kissing_heart", [ "kissing_heart" ] ) )
-- , ( "1f619"
--   , ( "\xD83D\xDE19"
--     , "kissing_smiling_eyes"
--     , [ "kissing_smiling_eyes" ]
--     )
--   )
-- , ( "1f61a"
--   , ( "\xD83D\xDE1A"
--     , "kissing_closed_eyes"
--     , [ "kissing_closed_eyes" ]
--     )
--   )
-- , ( "1f61b", ( "\xD83D\xDE1B", "stuck_out_tongue", [ "stuck_out_tongue" ] ) )
-- , ( "1f61c"
--   , ( "\xD83D\xDE1C"
--     , "stuck_out_tongue_winking_eye"
--     , [ "stuck_out_tongue_winking_eye" ]
--     )
--   )
-- , ( "1f61d"
--   , ( "\xD83D\xDE1D"
--     , "stuck_out_tongue_closed_eyes"
--     , [ "stuck_out_tongue_closed_eyes" ]
--     )
--   )
-- , ( "1f61e", ( "\xD83D\xDE1E", "disappointed", [ "disappointed" ] ) )
-- , ( "1f61f", ( "\xD83D\xDE1F", "worried", [ "worried" ] ) )
-- , ( "1f620", ( "\xD83D\xDE20", "angry", [ "angry" ] ) )
-- , ( "1f621", ( "\xD83D\xDE21", "rage", [ "rage" ] ) )
-- , ( "1f622", ( "\xD83D\xDE22", "cry", [ "cry" ] ) )
-- , ( "1f623", ( "\xD83D\xDE23", "persevere", [ "persevere" ] ) )
-- , ( "1f624", ( "\xD83D\xDE24", "triumph", [ "triumph" ] ) )
-- , ( "1f625"
--   , ( "\xD83D\xDE25"
--     , "disappointed_relieved"
--     , [ "disappointed_relieved" ]
--     )
--   )
-- , ( "1f626", ( "\xD83D\xDE26", "frowning", [ "frowning" ] ) )
-- , ( "1f627", ( "\xD83D\xDE27", "anguished", [ "anguished" ] ) )
-- , ( "1f628", ( "\xD83D\xDE28", "fearful", [ "fearful" ] ) )
-- , ( "1f629", ( "\xD83D\xDE29", "weary", [ "weary" ] ) )
-- , ( "1f62a", ( "\xD83D\xDE2A", "sleepy", [ "sleepy" ] ) )
-- , ( "1f62b", ( "\xD83D\xDE2B", "tired_face", [ "tired_face" ] ) )
-- , ( "1f62c", ( "\xD83D\xDE2C", "grimacing", [ "grimacing" ] ) )
-- , ( "1f62d", ( "\xD83D\xDE2D", "sob", [ "sob" ] ) )
-- , ( "1f62e", ( "\xD83D\xDE2E", "open_mouth", [ "open_mouth" ] ) )
-- , ( "1f62f", ( "\xD83D\xDE2F", "hushed", [ "hushed" ] ) )
-- , ( "1f630", ( "\xD83D\xDE30", "cold_sweat", [ "cold_sweat" ] ) )
-- , ( "1f631", ( "\xD83D\xDE31", "scream", [ "scream" ] ) )
-- , ( "1f632", ( "\xD83D\xDE32", "astonished", [ "astonished" ] ) )
-- , ( "1f633", ( "\xD83D\xDE33", "flushed", [ "flushed" ] ) )
-- , ( "1f634", ( "\xD83D\xDE34", "sleeping", [ "sleeping" ] ) )
-- , ( "1f635", ( "\xD83D\xDE35", "dizzy_face", [ "dizzy_face" ] ) )
-- , ( "1f636", ( "\xD83D\xDE36", "no_mouth", [ "no_mouth" ] ) )
-- , ( "1f637", ( "\xD83D\xDE37", "mask", [ "mask" ] ) )
-- , ( "1f638", ( "\xD83D\xDE38", "smile_cat", [ "smile_cat" ] ) )
-- , ( "1f639", ( "\xD83D\xDE39", "joy_cat", [ "joy_cat" ] ) )
-- , ( "1f63a", ( "\xD83D\xDE3A", "smiley_cat", [ "smiley_cat" ] ) )
-- , ( "1f63b", ( "\xD83D\xDE3B", "heart_eyes_cat", [ "heart_eyes_cat" ] ) )
-- , ( "1f63c", ( "\xD83D\xDE3C", "smirk_cat", [ "smirk_cat" ] ) )
-- , ( "1f63d", ( "\xD83D\xDE3D", "kissing_cat", [ "kissing_cat" ] ) )
-- , ( "1f63e", ( "\xD83D\xDE3E", "pouting_cat", [ "pouting_cat" ] ) )
-- , ( "1f63f", ( "\xD83D\xDE3F", "crying_cat_face", [ "crying_cat_face" ] ) )
-- , ( "1f640", ( "\xD83D\xDE40", "scream_cat", [ "scream_cat" ] ) )
-- , ( "1f645", ( "\xD83D\xDE45", "no_good", [ "no_good" ] ) )
-- , ( "1f646", ( "\xD83D\xDE46", "ok_woman", [ "ok_woman" ] ) )
-- , ( "1f647", ( "\xD83D\xDE47", "bow", [ "bow" ] ) )
-- , ( "1f648", ( "\xD83D\xDE48", "see_no_evil", [ "see_no_evil" ] ) )
-- , ( "1f649", ( "\xD83D\xDE49", "hear_no_evil", [ "hear_no_evil" ] ) )
-- , ( "1f64a", ( "\xD83D\xDE4A", "speak_no_evil", [ "speak_no_evil" ] ) )
-- , ( "1f64b", ( "\xD83D\xDE4B", "raising_hand", [ "raising_hand" ] ) )
-- , ( "1f64c", ( "\xD83D\xDE4C", "raised_hands", [ "raised_hands" ] ) )
-- , ( "1f64d", ( "\xD83D\xDE4D", "person_frowning", [ "person_frowning" ] ) )
-- , ( "1f64e"
--   , ( "\xD83D\xDE4E"
--     , "person_with_pouting_face"
--     , [ "person_with_pouting_face" ]
--     )
--   )
-- , ( "1f64f", ( "\xD83D\xDE4F", "pray", [ "pray" ] ) )
-- , ( "1f680", ( "\xD83D\xDE80", "rocket", [ "rocket" ] ) )
-- , ( "1f681", ( "\xD83D\xDE81", "helicopter", [ "helicopter" ] ) )
-- , ( "1f682", ( "\xD83D\xDE82", "steam_locomotive", [ "steam_locomotive" ] ) )
-- , ( "1f683", ( "\xD83D\xDE83", "railway_car", [ "railway_car" ] ) )
-- , ( "1f68b", ( "\xD83D\xDE8B", "train", [ "train" ] ) )
-- , ( "1f684", ( "\xD83D\xDE84", "bullettrain_side", [ "bullettrain_side" ] ) )
-- , ( "1f685", ( "\xD83D\xDE85", "bullettrain_front", [ "bullettrain_front" ] ) )
-- , ( "1f686", ( "\xD83D\xDE86", "train2", [ "train2" ] ) )
-- , ( "1f687", ( "\xD83D\xDE87", "metro", [ "metro" ] ) )
-- , ( "1f688", ( "\xD83D\xDE88", "light_rail", [ "light_rail" ] ) )
-- , ( "1f689", ( "\xD83D\xDE89", "station", [ "station" ] ) )
-- , ( "1f68a", ( "\xD83D\xDE8A", "tram", [ "tram" ] ) )
-- , ( "1f68c", ( "\xD83D\xDE8C", "bus", [ "bus" ] ) )
-- , ( "1f68d", ( "\xD83D\xDE8D", "oncoming_bus", [ "oncoming_bus" ] ) )
-- , ( "1f68e", ( "\xD83D\xDE8E", "trolleybus", [ "trolleybus" ] ) )
-- , ( "1f68f", ( "\xD83D\xDE8F", "busstop", [ "busstop" ] ) )
-- , ( "1f690", ( "\xD83D\xDE90", "minibus", [ "minibus" ] ) )
-- , ( "1f691", ( "\xD83D\xDE91", "ambulance", [ "ambulance" ] ) )
-- , ( "1f692", ( "\xD83D\xDE92", "fire_engine", [ "fire_engine" ] ) )
-- , ( "1f693", ( "\xD83D\xDE93", "police_car", [ "police_car" ] ) )
-- , ( "1f694"
--   , ( "\xD83D\xDE94"
--     , "oncoming_police_car"
--     , [ "oncoming_police_car" ]
--     )
--   )
-- , ( "1f695", ( "\xD83D\xDE95", "taxi", [ "taxi" ] ) )
-- , ( "1f696", ( "\xD83D\xDE96", "oncoming_taxi", [ "oncoming_taxi" ] ) )
-- , ( "1f697", ( "\xD83D\xDE97", "car", [ "car", "red_car" ] ) )
-- , ( "1f698"
--   , ( "\xD83D\xDE98"
--     , "oncoming_automobile"
--     , [ "oncoming_automobile" ]
--     )
--   )
-- , ( "1f699", ( "\xD83D\xDE99", "blue_car", [ "blue_car" ] ) )
-- , ( "1f69a", ( "\xD83D\xDE9A", "truck", [ "truck" ] ) )
-- , ( "1f69b", ( "\xD83D\xDE9B", "articulated_lorry", [ "articulated_lorry" ] ) )
-- , ( "1f69c", ( "\xD83D\xDE9C", "tractor", [ "tractor" ] ) )
-- , ( "1f69d", ( "\xD83D\xDE9D", "monorail", [ "monorail" ] ) )
-- , ( "1f69e", ( "\xD83D\xDE9E", "mountain_railway", [ "mountain_railway" ] ) )
-- , ( "1f69f", ( "\xD83D\xDE9F", "suspension_railway", [ "suspension_railway" ] ) )
-- , ( "1f6a0", ( "\xD83D\xDEA0", "mountain_cableway", [ "mountain_cableway" ] ) )
-- , ( "1f6a1", ( "\xD83D\xDEA1", "aerial_tramway", [ "aerial_tramway" ] ) )
-- , ( "1f6a2", ( "\xD83D\xDEA2", "ship", [ "ship" ] ) )
-- , ( "1f6a3", ( "\xD83D\xDEA3", "rowboat", [ "rowboat" ] ) )
-- , ( "1f6a4", ( "\xD83D\xDEA4", "speedboat", [ "speedboat" ] ) )
-- , ( "1f6a5", ( "\xD83D\xDEA5", "traffic_light", [ "traffic_light" ] ) )
-- , ( "1f6a6"
--   , ( "\xD83D\xDEA6"
--     , "vertical_traffic_light"
--     , [ "vertical_traffic_light" ]
--     )
--   )
-- , ( "1f6a7", ( "\xD83D\xDEA7", "construction", [ "construction" ] ) )
-- , ( "1f6a8", ( "\xD83D\xDEA8", "rotating_light", [ "rotating_light" ] ) )
-- , ( "1f6a9"
--   , ( "\xD83D\xDEA9"
--     , "triangular_flag_on_post"
--     , [ "triangular_flag_on_post" ]
--     )
--   )
-- , ( "1f6aa", ( "\xD83D\xDEAA", "door", [ "door" ] ) )
-- , ( "1f6ab", ( "\xD83D\xDEAB", "no_entry_sign", [ "no_entry_sign" ] ) )
-- , ( "1f6ac", ( "\xD83D\xDEAC", "smoking", [ "smoking" ] ) )
-- , ( "1f6ad", ( "\xD83D\xDEAD", "no_smoking", [ "no_smoking" ] ) )
-- , ( "1f6ae"
--   , ( "\xD83D\xDEAE"
--     , "put_litter_in_its_place"
--     , [ "put_litter_in_its_place" ]
--     )
--   )
-- , ( "1f6af", ( "\xD83D\xDEAF", "do_not_litter", [ "do_not_litter" ] ) )
-- , ( "1f6b0", ( "\xD83D\xDEB0", "potable_water", [ "potable_water" ] ) )
-- , ( "1f6b1", ( "\xD83D\xDEB1", "non-potable_water", [ "non-potable_water" ] ) )
-- , ( "1f6b2", ( "\xD83D\xDEB2", "bike", [ "bike" ] ) )
-- , ( "1f6b3", ( "\xD83D\xDEB3", "no_bicycles", [ "no_bicycles" ] ) )
-- , ( "1f6b4", ( "\xD83D\xDEB4", "bicyclist", [ "bicyclist" ] ) )
-- , ( "1f6b5", ( "\xD83D\xDEB5", "mountain_bicyclist", [ "mountain_bicyclist" ] ) )
-- , ( "1f6b6", ( "\xD83D\xDEB6", "walking", [ "walking" ] ) )
-- , ( "1f6b7", ( "\xD83D\xDEB7", "no_pedestrians", [ "no_pedestrians" ] ) )
-- , ( "1f6b8", ( "\xD83D\xDEB8", "children_crossing", [ "children_crossing" ] ) )
-- , ( "1f6b9", ( "\xD83D\xDEB9", "mens", [ "mens" ] ) )
-- , ( "1f6ba", ( "\xD83D\xDEBA", "womens", [ "womens" ] ) )
-- , ( "1f6bb", ( "\xD83D\xDEBB", "restroom", [ "restroom" ] ) )
-- , ( "1f6bc", ( "\xD83D\xDEBC", "baby_symbol", [ "baby_symbol" ] ) )
-- , ( "1f6bd", ( "\xD83D\xDEBD", "toilet", [ "toilet" ] ) )
-- , ( "1f6be", ( "\xD83D\xDEBE", "wc", [ "wc" ] ) )
-- , ( "1f6bf", ( "\xD83D\xDEBF", "shower", [ "shower" ] ) )
-- , ( "1f6c0", ( "\xD83D\xDEC0", "bath", [ "bath" ] ) )
-- , ( "1f6c1", ( "\xD83D\xDEC1", "bathtub", [ "bathtub" ] ) )
-- , ( "1f6c2", ( "\xD83D\xDEC2", "passport_control", [ "passport_control" ] ) )
-- , ( "1f6c3", ( "\xD83D\xDEC3", "customs", [ "customs" ] ) )
-- , ( "1f6c4", ( "\xD83D\xDEC4", "baggage_claim", [ "baggage_claim" ] ) )
-- , ( "1f6c5", ( "\xD83D\xDEC5", "left_luggage", [ "left_luggage" ] ) )
-- , ( "0023", ( "#⃣", "hash", [ "hash" ] ) )
-- , ( "0030", ( "0⃣", "zero", [ "zero" ] ) )
-- , ( "0031", ( "1⃣", "one", [ "one" ] ) )
-- , ( "0032", ( "2⃣", "two", [ "two" ] ) )
-- , ( "0033", ( "3⃣", "three", [ "three" ] ) )
-- , ( "0034", ( "4⃣", "four", [ "four" ] ) )
-- , ( "0035", ( "5⃣", "five", [ "five" ] ) )
-- , ( "0036", ( "6⃣", "six", [ "six" ] ) )
-- , ( "0037", ( "7⃣", "seven", [ "seven" ] ) )
-- , ( "0038", ( "8⃣", "eight", [ "eight" ] ) )
-- , ( "0039", ( "9⃣", "nine", [ "nine" ] ) )
-- , ( "1f1e8-1f1f3", ( "\xD83C\xDDE8\xD83C\xDDF3", "cn", [ "cn" ] ) )
-- , ( "1f1e9-1f1ea", ( "\xD83C\xDDE9\xD83C\xDDEA", "de", [ "de" ] ) )
-- , ( "1f1ea-1f1f8", ( "\xD83C\xDDEA\xD83C\xDDF8", "es", [ "es" ] ) )
-- , ( "1f1eb-1f1f7", ( "\xD83C\xDDEB\xD83C\xDDF7", "fr", [ "fr" ] ) )
-- , ( "1f1ec-1f1e7", ( "\xD83C\xDDEC\xD83C\xDDE7", "gb", [ "gb", "uk" ] ) )
-- , ( "1f1ee-1f1f9", ( "\xD83C\xDDEE\xD83C\xDDF9", "it", [ "it" ] ) )
-- , ( "1f1ef-1f1f5", ( "\xD83C\xDDEF\xD83C\xDDF5", "jp", [ "jp" ] ) )
-- , ( "1f1f0-1f1f7", ( "\xD83C\xDDF0\xD83C\xDDF7", "kr", [ "kr" ] ) )
-- , ( "1f1f7-1f1fa", ( "\xD83C\xDDF7\xD83C\xDDFA", "ru", [ "ru" ] ) )
-- , ( "1f1fa-1f1f8", ( "\xD83C\xDDFA\xD83C\xDDF8", "us", [ "us" ] ) )
