module Comments.List exposing (..)

import Model exposing (..)
import Msg exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import RemoteData exposing (..)

view : WebData (List Comment) -> Html Msg
view response = 
  div [ class "content" ]
    [ case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success comments ->
            list comments

        RemoteData.Failure error ->
            text (toString error)
    ]

commentRow : Comment -> Html Msg
commentRow comment = 
  tr []
    [ td [] [ text comment.id ]
    , td [] [ text comment.createdOn ]
    , td [] [ text comment.userId ]
    , td [] [ text comment.groupId ]
    , td [] [ text comment.songId ]
    , td [] [ text comment.body ]
    ]

list : List Comment -> Html Msg
list comments = 
    table []
      [ thead [] 
        [ tr [] 
          [ th [] [ text "ID" ]
          , th [] [ text "Created On" ]
          , th [] [ text "User ID" ]
          , th [] [ text "Group ID" ]
          , th [] [ text "Song Id" ]
          , th [] [ text "Body" ]
          ]
        ]
      , tbody [] (List.map commentRow comments)
      ] 
    