module Model exposing (..)

import RemoteData exposing (WebData)

type alias Model =
  { comments: WebData (List Comment)
  }

type alias Comment =
  { groupId : String
  , songId : String
  , body : String
  , userId: String
  , createdOn: String
  , id: String
  }

initialModel :  Model
initialModel =
    { comments = RemoteData.Loading
    }
