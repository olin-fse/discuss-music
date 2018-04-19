#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE ROLE $DB_USER WITH LOGIN PASSWORD '$DB_PASS';
    CREATE DATABASE $DB_NAME;
    GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$DB_USER" -d "$DB_NAME" <<-EOSQL
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
EOSQL
