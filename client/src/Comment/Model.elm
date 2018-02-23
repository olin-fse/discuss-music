module Comment.Model exposing (..)

import Comment.Msg as Msg exposing (..)

type alias Model =
  { groupId : String
  , songId : String
  , body : String
  , userId: String
  }


init : Model
init =
  Model "" "" "" ""