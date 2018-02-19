module Msg exposing (..)

import Model exposing (..)


type Msg
    = GroupId String
    | UserId String
    | Body String
    | SongId String


update : Msg -> Model -> Model
update msg model =
  case msg of
    GroupId groupId ->
      { model | groupId = groupId }

    UserId userId ->
      { model | userId = userId }

    Body body ->
      { model | body = body }

    SongId songId ->
      { model | songId = songId }