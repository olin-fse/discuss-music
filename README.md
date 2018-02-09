# discuss-music

A platform for groups of friends to discuss and share music from Spotify.

Built using Node.js, Elm.js, and PostgreSQL for Olin's Full Stack Engineering course.

## Running the app
To start the app, type `npm start` in the project's root directory. The client will be running on port `3000` and the server will be running on port `3001`.

## Database Setup
Create a database called muse in the postgreSQL shell.
```
CREATE ROLE muse WITH LOGIN PASSWORD '[pw here]';
CREATE DATABASE muse;
GRANT ALL PRIVILEGES ON DATABASE muse TO muse;
/c muse;
```

To create tables with the schema run the follwing in the terminal:
`psql -d muse -f schema.sql`