-- Seed data with a fake user for testing

insert into users (name, email, entries, joined) values ('test1', 'test1@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test2', 'test2@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test3', 'test3@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test4', 'test4@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test5', 'test5@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test6', 'test6@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test7', 'test7@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test8', 'test8@test.com', 5, '2018-01-01');

INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 2);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 2, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 3);

INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 1, now() - INTERVAL '15 HOURS', now() + INTERVAL '9 HOURS',89 , now() + INTERVAL '5 HOURS' ,now() - INTERVAL '10 HOURS');
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 2, now() - INTERVAL '10 HOURS', now() + INTERVAL '14 HOURS',56,  now() + INTERVAL '9 HOURS' ,null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 3, now() - INTERVAL '19 HOURS', now() + INTERVAL '5 HOURS',312, null ,null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 4, now() - INTERVAL '3 HOURS', now() + INTERVAL '21 HOURS',465, null ,null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 5, now() - INTERVAL '8 HOURS', now() + INTERVAL '16 HOURS',651, null ,null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 6, null, null,0, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 7, null, null,2, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 8, null, null,4, null, null);


insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test1@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test2@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test3@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test4@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test5@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test6@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test7@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test8@test.com');