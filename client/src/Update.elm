module Update exposing (..)

import Msg exposing (..)
import Commands exposing (..)
import Model exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    OnFetchComments response ->
      ({ model | comments = response }, Cmd.none)

    GroupId groupId ->
      let
        oldComments = model.newComment
        newComments = 
          { oldComments | groupId = groupId }
      in
        ({ model | newComment = newComments}, Cmd.none)

    UserId userId ->
      let
        oldComments = model.newComment
        newComments = 
          { oldComments | userId = userId }
      in
        ({ model | newComment = newComments}, Cmd.none)

    Body body ->
      let
        oldComments = model.newComment
        newComments = 
          { oldComments | body = body }
      in
        ({ model | newComment = newComments}, Cmd.none)

    SongId songId ->
      let
        oldComments = model.newComment
        newComments = 
          { oldComments | songId = songId }
      in
        ({ model | newComment = newComments}, Cmd.none)

    OnSubmitForm ->
       ( model, submitForm model.newComment ) 

    FormSubmitted (Ok data)->
      ( { model | newComment = initialNewComment}, fetchComments )

    FormSubmitted (Err _)->
      ( model, Cmd.none )


