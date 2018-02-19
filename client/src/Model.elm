module Model exposing (..)

type alias Model =
  { groupId : String
  , songId : String
  , body : String
  , userId: String
  }


model : Model
model =
  Model "" "" "" ""