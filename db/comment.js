var db = require('./db');

const insert = comment => {
  const text =
    `INSERT INTO comments(user_id, song_id, group_id, body)
    VALUES($1, $2, $3, $4)
    RETURNING id`;
  const values = [comment.userId, comment.songId, comment.groupId, comment.body];
  return db.one({text, values});
};

const get = id => {
  const text =
   `SELECT id, created_on, user_id, song_id, group_id, body
    FROM comments
    WHERE id=$1`;
  const values = [id];
  return db.one({text, values});
}

const getAll = () => {
  const text =
   `SELECT id, created_on, user_id, song_id, group_id, body
    FROM comments`;
  const values = [];
  return db.any({text, values});
}

const remove = id => {
  const text =
   `DELETE FROM comments
    WHERE id=$1`;
  const values = [id];
  return db.result({text, values});
}

module.exports = {
  insert,
  get,
  getAll,
  remove,
}
