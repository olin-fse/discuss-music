module Commands exposing (..)

import Http
import Model exposing (Model, Comment)
import Msg exposing (..)
import Json.Decode as Decode
import Json.Encode as Encode
import Dict exposing (Dict)


postCommentsUrl : String
postCommentsUrl =
    "http://localhost:3001/comment"

fetchCommentsUrl : String
fetchCommentsUrl =
    "http://localhost:3001/comment"

commentEncoder : Comment -> Encode.Value
commentEncoder comment =
    Encode.object
        [ ( "groupId", Encode.string comment.groupId )
        , ( "userId", Encode.string comment.userId )
        , ( "body", Encode.string comment.body )
        , ( "songId", Encode.string comment.songId )
        ]

commentDecoder : Decode.Decoder (Dict String Int)
commentDecoder =
    Decode.dict Decode.int

submitForm : Comment -> Cmd Msg
submitForm comment =
    let
        body =
            comment
                |> commentEncoder
                |> Http.jsonBody
    in
        Http.post postCommentsUrl body commentDecoder
            |> Http.send FormSubmitted

--fetchCommnets : Cmd Msg
fetchComments =
    Http.get fetchCommentsUrl commentDecoder
        |> Http.send CommentsFetched


