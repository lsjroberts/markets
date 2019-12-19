module Main exposing (Model, Msg(..), init, main, update, view)

import Api.Enum.Side as Side
import Api.Object.Exchange as Exchange
import Api.Object.Order as Order
import Api.Query as Query
import Browser
import Browser.Navigation as Nav
import Element exposing (..)
import Graphql.Http
import Graphql.Operation exposing (RootQuery)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet, hardcoded, with)
import Html exposing (Html)
import Http
import RemoteData exposing (RemoteData)
import Url
import Url.Parser as Parser exposing ((</>), Parser, custom, fragment, map, oneOf, s, top)



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.application
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }



---- MODEL ----


type alias Model =
    { key : Nav.Key
    , page : Page
    , exchanges : Request (List Exchange)
    }


type Page
    = NotFound
    | HomePage


type alias Exchange =
    { name : String
    , orders : Maybe (List Order)
    }


type alias Order =
    { fulfilled : Int
    , shares : Int
    , side : Side.Side
    }


query : SelectionSet decodeTo RootQuery -> (RemoteData (Graphql.Http.RawError () Http.Error) decodeTo -> Msg) -> Cmd Msg
query queryConstructor msg =
    queryConstructor
        |> Graphql.Http.queryRequest "http://localhost:4000/api"
        |> Graphql.Http.send
            (Graphql.Http.parseableErrorAsSuccess
                >> Graphql.Http.withSimpleHttpError
                >> RemoteData.fromResult
                >> msg
            )


queryExchanges : SelectionSet (List Exchange) RootQuery
queryExchanges =
    Query.exchanges
        exchangeSelection


exchangeSelection =
    SelectionSet.succeed Exchange
        |> with Exchange.name
        |> with (Exchange.orders orderSelection)


orderSelection =
    SelectionSet.succeed Order
        |> with Order.fulfilled
        |> with Order.shares
        |> with Order.side


type alias Request a =
    RemoteData (Graphql.Http.RawError () Http.Error) a


init : Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init url key =
    changeUrlTo url
        { key = key
        , page = HomePage
        , exchanges = RemoteData.NotAsked
        }



---- UPDATE ----


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | GotExchanges (Request (List Exchange))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotExchanges exchanges ->
            ( { model | exchanges = exchanges }, Cmd.none )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            changeUrlTo url model



---- VIEW ----


view : Model -> Browser.Document Msg
view model =
    { title = "Markets"
    , body =
        [ layout [] <|
            viewResponse
                (\exchanges -> List.map viewExchange exchanges |> column [ spacing 36 ])
                model.exchanges
        ]
    }


viewExchange : Exchange -> Element Msg
viewExchange { name, orders } =
    column [ spacing 24 ]
        [ el [] (text name)
        , case orders of
            Just os ->
                column [ spacing 16 ]
                    (List.map
                        (\o ->
                            row [ spacing 8 ]
                                [ text (Side.toString o.side)
                                , text (String.fromInt o.shares)
                                , text (String.fromInt o.fulfilled)
                                ]
                        )
                        os
                    )

            Nothing ->
                none
        ]


viewResponse : (a -> Element Msg) -> Request a -> Element Msg
viewResponse success response =
    case response of
        RemoteData.Loading ->
            text "loading"

        RemoteData.Success result ->
            success result

        RemoteData.Failure _ ->
            text "error"

        RemoteData.NotAsked ->
            none



---- ROUTER ----


changeUrlTo url model =
    let
        parser =
            oneOf
                [ route top (routeHome model)

                -- , route (s "occasion" </> Parser.string) (\occasion -> routeOccasion model occasion)
                -- , route (s "team" </> Parser.string) (\team -> routeTeam model team)
                -- , route (s "marble" </> Parser.string) (\marble -> routeMarble model marble)
                ]
    in
    case Parser.parse parser url of
        Just answer ->
            answer

        Nothing ->
            ( { model | page = NotFound }, Cmd.none )


route parser handler =
    Parser.map handler parser


routeHome model =
    ( { model | page = HomePage }
    , query queryExchanges GotExchanges
    )
