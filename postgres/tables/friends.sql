BEGIN TRANSACTION;

CREATE TABLE friends (
    friends_id serial PRIMARY KEY,
    user_a integer NOT NULL REFERENCES users,
    user_b integer NOT NULL REFERENCES users
);

COMMIT;