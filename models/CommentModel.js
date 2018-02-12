const db = require('../db/index');
const pgp = require('pg-promise')();

class CommentModel {
	constructor(dbModel) {
		this.userId = dbModel.user_id;
		this.songId = dbModel.song_id;
		this.groupId = dbModel.group_id;
		this.body = dbModel.body;
	};


	static insertToDb(jsonModel) {
		const columns = ['user_id', 'song_id', 'group_id', 'body'];
		const values = [{
			user_id: jsonModel.userId,
			song_id: jsonModel.songId,
			group_id: jsonModel.groupId,
			body: jsonModel.body
		}];
		const query = pgp.helpers.insert(values, columns, 'comments')
		
		return db.none(query);
	}

}

module.exports = CommentModel;