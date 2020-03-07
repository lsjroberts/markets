-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Api.Enum.CurrencyLocation exposing (..)

import Json.Decode as Decode exposing (Decoder)


type CurrencyLocation
    = Prefix
    | Suffix


list : List CurrencyLocation
list =
    [ Prefix, Suffix ]


decoder : Decoder CurrencyLocation
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "PREFIX" ->
                        Decode.succeed Prefix

                    "SUFFIX" ->
                        Decode.succeed Suffix

                    _ ->
                        Decode.fail ("Invalid CurrencyLocation type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : CurrencyLocation -> String
toString enum =
    case enum of
        Prefix ->
            "PREFIX"

        Suffix ->
            "SUFFIX"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe CurrencyLocation
fromString enumString =
    case enumString of
        "PREFIX" ->
            Just Prefix

        "SUFFIX" ->
            Just Suffix

        _ ->
            Nothing
