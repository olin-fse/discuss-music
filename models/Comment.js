class CommentModel {
	constructor(id, createdOn, userId, songId, groupId, body) {
		this.id = id;
		this.createdOn = createdOn;
		this.userId = userId;
		this.songId = songId;
		this.groupId = groupId;
		this.body = body;
	}
}


class CommentMapper{
  static dbToModel(dbObject) {
		return new CommentModel(
			dbObject.id,
			dbObject.created_on,
			dbObject.user_id,
			dbObject.song_id,
			dbObject.group_id,
			dbObject.body
		);
  }
  
  static httpToModel(httpObject) {
		return new CommentModel(
			httpObject.id,
			httpObject.createdOn,
			httpObject.userId,
			httpObject.songId,
      httpObject.groupId,
      httpObject.body
    );
	}
}


module.exports = {
	Model: CommentModel,
	Mapper: CommentMapper,
}
