module Main exposing (..)

import Html exposing (..)
import Model exposing (..)
import View exposing (..)
import Update exposing (..)

main =
  Html.program
    { init = init 
    , subscriptions = \_ -> Sub.none
    , update = update
    , view = view
    }