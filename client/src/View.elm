module View exposing (..)

import Html exposing (..)
import Html.Events exposing (onInput, onClick)
import Html.Attributes exposing (..)


import Model exposing (..)
import Msg exposing (..)
import Comments.List exposing (..)


view : Model -> Html Msg
view model =
  main_ []
    [ div [ class "navbar is-light" ]
      [ div [ class "navbar-brand" ]
        [ a [ class "navbar-item" ]
          [ h1 [] [ text "Muse" ] ]
        ]
      , div [ class "navbar-end" ]
        [ div [ class "navbar-item" ]
          [ a [ class "button is-primary" ]
            [ text "Login" ]
          ]
        ]
      ]
    , div [ class "content" ]
      [ div [ class "container" ]
        [ div [ class "field is-horizontal" ]
          [ div [ class "field-label is-normal"]
            [ label [ class "label" ]
              [ text "Comment" ]
            ]
          , div [ class "field-body" ]
            [ div [ class "field" ]
              [ p [ class "control is-expanded" ]
                [ input [ class "input", type_ "text", placeholder "groupId", onInput GroupId ] [] ]
              ]
            , div [ class "field" ]
              [ p [ class "control is-expanded" ]
                [ input [ class "input", type_ "text", placeholder "userId", onInput UserId ] [] ]
              ]
            , div [ class "field" ]
              [ p [ class "control is-expanded" ]
                [ input [ class "input", type_ "text", placeholder "songId", onInput SongId ] [] ]
              ]
            , div [ class "field" ]
              [ p [ class "control is-expanded" ]
                [ input [ class "input", type_ "text", placeholder "body", onInput Body ] [] ]
              ]
            , button [ class "button", onClick OnSubmitForm ]
              [ text "Post" ]
            ]
          ]
          , Comments.List.view model.comments
        ]
      ]
    ]
