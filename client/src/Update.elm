module Update exposing (..)

import Msg exposing (..)
import Model exposing (..)
import Comment.Update as Comment exposing (..)
import Comment.Msg as CommentMsg exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Comment comment ->
      ({model | comment = Comment.update Comment comment}, Cmd.none)

