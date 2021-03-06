-- Seed data with a fake user for testing

insert into users (name, email, entries, joined) values ('test1', 'test1@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test2', 'test2@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test3', 'test3@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test4', 'test4@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test5', 'test5@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test6', 'test6@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test7', 'test7@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test8', 'test8@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test9', 'test9@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test10', 'test10@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test11', 'test11@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test12', 'test12@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test13', 'test13@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test14', 'test14@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test15', 'test15@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test16', 'test16@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test17', 'test17@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test18', 'test18@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test19', 'test19@test.com', 5, '2018-01-01');
insert into users (name, email, entries, joined) values ('test20', 'test20@test.com', 5, '2018-01-01');

INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 2);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 2, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 3);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 4);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 4, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 4, 2);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 2, 4);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 7);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 7, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 6);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 6, 1);

INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 8);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 9);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 10);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 11);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 12);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 13);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 14);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 15);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 16);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 17);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 18);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 19);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 1, 20);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 8, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 9, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 10, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 11, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 12, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 13, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 14, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 15, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 16, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 17, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 18, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 19, 1);
INSERT INTO FRIENDS ( user_a, user_b ) VALUES ( 20, 1);




INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 1, now() - INTERVAL '15 HOURS', now() + INTERVAL '9 HOURS',89 , now() + INTERVAL '5 HOURS' ,now() - INTERVAL '10 HOURS');
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 2, now() - INTERVAL '10 HOURS', now() + INTERVAL '14 HOURS',56,  now() + INTERVAL '9 HOURS' ,null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 3, now() - INTERVAL '19 HOURS', now() + INTERVAL '5 HOURS',312, null ,null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 4, now() - INTERVAL '3 HOURS', now() + INTERVAL '21 HOURS',465, null ,null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 5, now() - INTERVAL '8 HOURS', now() + INTERVAL '16 HOURS',651, null ,null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 6, null, null,0, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 7, null, null,2, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 8, null, null,4, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 9, null, null,4, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 10, null, null,4, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 11, null, null,4, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 12, null, null,4, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 13, null, null,4, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 14, null, null,4, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 15, null, null,4, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 16, null, null,4, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 17, null, null,4, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 18, null, null,4, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 19, null, null,4, null, null);
INSERT INTO mining ( id, activated_time, expired_time, coins, existed_expired_time, friend_activated_time) VALUES ( 20, null, null,4, null, null);


insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test1@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test2@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test3@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test4@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test5@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test6@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test7@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test8@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test9@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test10@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test11@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test12@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test13@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test14@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test15@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test16@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test17@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test18@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test19@test.com');
insert into login (hash, email) values ('$2b$10$3ITl.ZjrlMRVlpcdbzA32u.44BEyRzf7jA.1FDCQFVy2t1Y/mVG6K', 'test20@test.com');