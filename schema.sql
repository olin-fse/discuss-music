CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  name VARCHAR
);

CREATE TABLE groups (
  id SERIAL PRIMARY KEY,
  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  name VARCHAR
);

CREATE TABLE groupings (
  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  user_id INT,
  group_id INT,
  PRIMARY KEY (user_id, group_id)
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  user_id INT NOT NULL,
  group_id INT NOT NULL,
  song_id INT NOT NULL,
  body VARCHAR
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  group_id INT NOT NULL,
  album VARCHAR,
  artist VARCHAR,
  length INT NOT NULL,
  name VARCHAR
);
