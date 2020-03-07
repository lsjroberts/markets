-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Api.Enum.Factor exposing (..)

import Json.Decode as Decode exposing (Decoder)


type Factor
    = Country
    | Industry
    | Momentum
    | Volatility


list : List Factor
list =
    [ Country, Industry, Momentum, Volatility ]


decoder : Decoder Factor
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "COUNTRY" ->
                        Decode.succeed Country

                    "INDUSTRY" ->
                        Decode.succeed Industry

                    "MOMENTUM" ->
                        Decode.succeed Momentum

                    "VOLATILITY" ->
                        Decode.succeed Volatility

                    _ ->
                        Decode.fail ("Invalid Factor type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : Factor -> String
toString enum =
    case enum of
        Country ->
            "COUNTRY"

        Industry ->
            "INDUSTRY"

        Momentum ->
            "MOMENTUM"

        Volatility ->
            "VOLATILITY"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Factor
fromString enumString =
    case enumString of
        "COUNTRY" ->
            Just Country

        "INDUSTRY" ->
            Just Industry

        "MOMENTUM" ->
            Just Momentum

        "VOLATILITY" ->
            Just Volatility

        _ ->
            Nothing