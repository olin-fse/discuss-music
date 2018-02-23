module Commands exposing (..)

import Http 
import Dict exposing (Dict)
import Model exposing (..)
import Json.Decode as Decode exposing (int, string, dict)
import Json.Encode as Encode exposing (..)
import Msg exposing (..)

url : String
url =
    "http://localhost:3001/comment"

commentEncoder : Model -> Encode.Value
commentEncoder model =
    Encode.object
        [ ( "groupId", Encode.string model.groupId )
        , ( "userId", Encode.string model.userId )
        , ( "body", Encode.string model.body )
        , ( "songId", Encode.string model.songId )
        ]

commentDecoder : Decode.Decoder (Dict String Int)
commentDecoder =
    Decode.dict Decode.int

submitForm : Model -> Cmd Msg
submitForm model =
    let
        body =
            model
                |> commentEncoder
                |> Http.jsonBody
    in
        Http.post "http://localhost:3001/comment" body commentDecoder
            |> Http.send FormSubmitted
