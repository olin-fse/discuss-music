module Commands exposing (..)

import Http
import Model exposing (Model)
import Msg exposing (..)
import Json.Decode as Decode
import Json.Encode as Encode
import Dict exposing (Dict)

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
        Http.post url body commentDecoder
            |> Http.send FormSubmitted
