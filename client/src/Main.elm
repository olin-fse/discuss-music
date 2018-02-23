module Main exposing (..)

import Html exposing (..)
import Model exposing (..)
import View exposing (..)
import Update exposing (..)
import Msg exposing (..)

main: Program Never Model Msg.Msg
main =
  Html.program
    { init = init 
    , subscriptions = \_ -> Sub.none
    , update = update
    , view = view
    }