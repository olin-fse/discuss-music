module Comment.Msg exposing (..)

import Http

type Msg
    = GroupId String
    | UserId String
    | Body String
    | SongId String
    | OnSubmitForm
    | FormSubmitted (Result Http.Error String)