module Commands exposing (..)

import Http
import Model exposing (Model, Comment, NewComment)
import Msg exposing (..)
import Json.Decode as Decode
import Json.Encode as Encode
import Json.Decode.Pipeline exposing (decode, required)
import Dict exposing (Dict)
import RemoteData exposing (..)


postCommentsUrl : String
postCommentsUrl =
  "http://localhost:3001/comment"

fetchCommentsUrl : String
fetchCommentsUrl =
  "http://localhost:3001/comment"

formEncoder : NewComment -> Encode.Value
formEncoder comment =
  Encode.object
    [ ( "groupId", Encode.string comment.groupId )
    , ( "userId", Encode.string comment.userId )
    , ( "body", Encode.string comment.body )
    , ( "songId", Encode.string comment.songId )
    ]

commentsDecoder : Decode.Decoder (List Comment)
commentsDecoder =
  Decode.list commentDecoder

commentDecoder : Decode.Decoder Comment
commentDecoder =
  decode Comment
      |> required "groupId" Decode.int
      |> required "songId" Decode.int
      |> required "body" Decode.string
      |> required "userId" Decode.int
      |> required "createdOn" Decode.string
      |> required "id" Decode.int

submitForm : NewComment -> Cmd Msg
submitForm comment =
  let
    body =
      comment
        |> formEncoder
        |> Http.jsonBody
  in
    Http.post postCommentsUrl body formDecoder
      |> Http.send FormSubmitted

formDecoder : Decode.Decoder (Dict String Int)
formDecoder =
    Decode.dict Decode.int


fetchComments : Cmd Msg
fetchComments =
    Http.get fetchCommentsUrl commentsDecoder
      |> RemoteData.sendRequest 
      |> Cmd.map OnFetchComments

