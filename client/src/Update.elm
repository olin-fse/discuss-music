module Update exposing (..)

import Msg exposing (..)
import Commands exposing (..)
import Model exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    GroupId groupId ->
     ( { model | groupId = groupId }, Cmd.none)

    UserId userId ->
      ({ model | userId = userId }, Cmd.none)

    Body body ->
      ({ model | body = body }, Cmd.none)

    SongId songId ->
      ({ model | songId = songId }, Cmd.none)

    OnSubmitForm ->
       ( model, submitForm model ) 

    FormSubmitted (Ok string)->
      ( model, Cmd.none )

    FormSubmitted (Err _)->
      ( model, Cmd.none )