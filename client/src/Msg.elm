module Msg exposing (..)

import Dict exposing (Dict)
import Http

type Msg
    = GroupId String
    | UserId String
    | Body String
    | SongId String
    | OnSubmitForm
    | FormSubmitted (Result Http.Error (Dict String Int))
