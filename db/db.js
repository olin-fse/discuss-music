const pgp = require('pg-promise')();

let connection = {
  host: process.env.DB_HOST, 
  port: process.env.DB_PORT,
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
};
if (process.env.NODE_ENV === 'test') {
  connection.database = process.env.DB_NAME_TEST;
  connection.user = process.env.DB_USER_TEST;
  connection.password = process.env.DB_PASS_TEST;
}

const db = pgp(connection);

module.exports = db;
