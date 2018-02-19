module Main exposing (..)

import Html exposing (..)
import Msg exposing (..)
import Model exposing (..)
import View exposing (..)

main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }