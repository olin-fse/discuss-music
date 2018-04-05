# discuss-music

A platform for groups of friends to discuss and share music from Spotify.

Built using Elm, Node.js, and PostgreSQL for Olin's Full Stack Engineering course.

## Database Setup
Install [PostgreSQL](https://www.postgresql.org/download/) and make sure it's running.
Create a database called muse in the PostgreSQL shell:
```
CREATE ROLE muse WITH LOGIN PASSWORD '[pw here]';
CREATE DATABASE muse;
GRANT ALL PRIVILEGES ON DATABASE muse TO muse;
\c muse;
```

To create tables with the schema run the follwing in the terminal:
`psql -d muse -U muse -f schema.sql`

## Running the app
First, install dependencies by running `npm install` in the project's root directory. Then, copy the `.env.template` file and rename the copied file to `.env`. Fill in the database name, username, and password as you set up in Database Setup.

To start the app, run `npm start`. The client will be running on port `3000` and the server will be running on port `3001`. Alternatively, the server and client can be started separately, using `npm run server` and `npm run client`, respectively.

## Testing
In order to run the tests, first set up test database named `muse_test` and apply the schema using the commands in Database Setup. Then, run `npm test` in the root directory to run all integration and unit tests. To run end-to-end tests, make sure that the app is running locally with `npm start` and then simply run `npm run e2e`.
