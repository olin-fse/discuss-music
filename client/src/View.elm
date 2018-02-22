module View exposing (..)

import Html exposing (..)
import Html.Events exposing (onInput, onClick)
import Html.Attributes exposing (..)


import Model exposing (..)
import Msg exposing (..)


view : Model -> Html Msg
view model =
  div [] 
    [ input [ type_ "groupId", placeholder "Group Id", onInput GroupId ] []
    , input [ type_ "userId", placeholder "User Id", onInput UserId ] []
    , input [ type_ "body", placeholder "Body", onInput Body ] []
    , input [ type_ "songId", placeholder "Song Id", onInput SongId ] []
    , button [ placeholder "Submit", onClick OnSubmitForm ] [ text "Submit" ] 
    ]