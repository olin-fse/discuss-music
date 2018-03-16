module Model exposing (..)

import RemoteData exposing (WebData)

type alias Model =
  { comments: WebData (List Comment)
  , newComment: NewComment
  }


initialModel : Model
initialModel =
    { comments = RemoteData.Loading
    , newComment = initialNewComment
    }

initialNewComment : NewComment
initialNewComment =
  { groupId = ""
  , songId = ""
  , body = ""
  , userId = ""
  }

type alias Comment =
  { groupId : Int
  , songId : Int
  , body : String
  , userId: Int
  , createdOn: String
  , id: Int
  }

type alias NewComment =
  { groupId : String
  , songId : String
  , body : String
  , userId: String
  }
