-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Api.Object.Currency exposing (location, name, symbol, ticker)

import Api.Enum.CurrencyLocation
import Api.InputObject
import Api.Interface
import Api.Object
import Api.Scalar
import Api.ScalarCodecs
import Api.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


location : SelectionSet Api.Enum.CurrencyLocation.CurrencyLocation Api.Object.Currency
location =
    Object.selectionForField "Enum.CurrencyLocation.CurrencyLocation" "location" [] Api.Enum.CurrencyLocation.decoder


name : SelectionSet String Api.Object.Currency
name =
    Object.selectionForField "String" "name" [] Decode.string


symbol : SelectionSet String Api.Object.Currency
symbol =
    Object.selectionForField "String" "symbol" [] Decode.string


ticker : SelectionSet String Api.Object.Currency
ticker =
    Object.selectionForField "String" "ticker" [] Decode.string
