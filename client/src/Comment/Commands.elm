module Comment.Commands exposing (..)

import Http 
import Json.Decode as Decode exposing (int, string)
import Json.Encode as Encode exposing (..)
import Comment.Model as Model exposing (..)
import Comment.Msg as Msg exposing (..)

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

submitForm : Model -> Cmd Msg
submitForm model =
    let
        body =
            model
                |> commentEncoder
                |> Http.jsonBody
    in 
        Http.post "http://localhost:3001/comment" body Decode.string
            |> Http.send FormSubmitted
