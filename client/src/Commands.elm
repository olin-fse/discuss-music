module Commands exposing (..)

import Http
import Model exposing (..)
import Json.Decode as Decode exposing (int, string)
import Json.Encode as Encode exposing (..)

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

postComment : Model -> String -> Decode.Decoder String -> Http.Request String
postComment model url =
    let
        body =
            model
                |> commentEncoder
                |> Http.jsonBody
    in
        Http.post url body

--jsonBodyVar : Json.Decode.Value -> Http.Body
--jsonBodyVar value = 
--   {
--      groupId = value.GroupId 
--    , userId = value.UserId 
--    , body = value.Body
--    , songId = value.SongId
--    } 

