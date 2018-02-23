module Msg exposing (..)

import Http
--import Model exposing (..)

type Msg
    = GroupId String
    | UserId String
    | Body String
    | SongId String
    | OnSubmitForm
    | FormSubmitted (Result Http.Error String)
