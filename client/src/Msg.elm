module Msg exposing (..)

import Dict exposing (Dict)
import Http
import Model exposing (Comment)
import RemoteData exposing (WebData)


type Msg
    = GroupId String
    | UserId String
    | Body String
    | SongId String
    | OnSubmitForm
    | FormSubmitted (Result Http.Error (Dict String Int))
    | OnFetchComments (WebData (List Comment))
    | CommentsFetched (Result Http.Error (Dict String Int))
