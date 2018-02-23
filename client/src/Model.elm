module Model exposing (..)

import Comment.Model
import Msg exposing (..)

type alias Model =
  { comment : Comment.Model.Model
  }


init : (Model, Cmd Msg)
init =
  ({comment = Comment.Model.init}, Cmd.none)
