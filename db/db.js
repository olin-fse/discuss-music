const pgp = require('pg-promise')();

const getConnection = () => {
  switch(process.env.NODE_ENV) {
    case 'test':
      return {
        host: 'localhost', 
        port: 5432,
        database: 'muse_test',
        user: process.env.DB_USER,
        password: process.env.DB_PASS,
      };
      break;
    default:
      return {
        host: 'localhost', 
        port: 5432,
        database: process.env.DB_NAME,
        user: process.env.DB_USER,
        password: process.env.DB_PASS,
      };
      break;
  }
}

const db = pgp(getConnection());

module.exports = db;
