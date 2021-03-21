BEGIN TRANSACTION;

CREATE TABLE mining (
    id serial PRIMARY KEY,
    activated_time TIMESTAMP,
    expired_time TIMESTAMP,
    coins int,
    existed_expired_time TIMESTAMP,
    friend_activated_time TIMESTAMP,
);

COMMIT;