module Model exposing (..)

import Msg exposing (..)

type alias Model =
  { groupId : String
  , songId : String
  , body : String
  , userId: String
  }


init : (Model, Cmd Msg)
init =
  (Model "" "" "" "", Cmd.none)
