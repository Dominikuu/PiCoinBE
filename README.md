# PiCoinBE

  PiCoinBE is a dockerized app, containing of Nodjs/Express, PostgreSQL,Redis, Nginx.

### GUI
Please refer to https://github.com/Dominikuu/PiCoinFE


### Calculate
coin計算: user mining 24hr期間 x 1 + bonus** x 0.25

Rule of bonus period:
1. Activate時，有朋友正在mining，且在mining時也有朋友Activate
  1. W/O overlap
   (existed_expired_time - activated_time) + (expired - friend_activated_time)
  2. With overlap
    expired_time - activated_time

2. 只有Activate時，有朋友正在mining
  (existed_expired_time - activated_time)

3. 只有mining時也有朋友Activate
  (expired - friend_activated_time)

### API
Get friend id list
- GET /{user_id}/friends

Get user's mining status (including coin, activate time and expired time)
- GET /{user_id}/mining

Start mining
- POST /{user_id}/mining

### DB schema
- friend

| Column    | Type   |
|-----------|--------|
| friend_id | SERIAL |
| user_a    | SERIAL |
| user_b    | SERIAL |

- mining

| Column                 | Type      |
|------------------------|-----------|
| id*                    | SERIAL    |
| activated_time         | TIMESTAMP |
| expired_time           | TIMESTAMP |
| coins                  | INT       |
| existed_expired_time   | INT       |
| friend_activated_time  | INT       |

"existed_expired_time": maximum expired_time in all friends when activating

"friend_activated_time": record latest activated time of friend during mining

- login

| Column | Type                  |
|--------|-----------------------|
| id*    | SERIAL                |
| hash   | VARCHAR(100) NOT NULL |
| email  | TEXT UNIQUE NOT NULL  |

- user

| Column  | Type                 |
|---------|----------------------|
| id*     | SERIAL               |
| name    | VARCHAR(100)         |
| email   | TEXT UNIQUE NOT NULL |
| entries | BIGING DEFAULT 0     |
| joined  | TIMESTAMP NOT NULL   |

### Test account

test1@test.com (Mining with bonus period 1)

test2@test.com (Mining with bonus period 2)

test3@test.com (Mining)

test4@test.com (Mining)

test5@test.com (Mining)

test6@test.com (Ready for activate)

test7@test.com (Ready for activate)

test8@test.com (Ready for activate)

### Setup procedure
1. clone the PiCoinBE project
2. Setup by docker-compose

```
#Build up container
docker-compose up --build

#Stop and remove container & volume
#docker-compose down -v
```
