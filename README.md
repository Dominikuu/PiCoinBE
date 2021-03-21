# PiCoinBE

  PiCoinBE is a dockerized app, containing of Nodjs/Express, PostgreSQL,Redis, Nginx.

### GUI
Please refer to https://github.com/Dominikuu/PiCoinFE

coin計算: user mining 24hr期間 x 1 + 好友有上線的期間(minimum of friend activated_time ~ maximum of friend expired_time) x 0.25



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

| Column         | Type      |
|----------------|-----------|
| id*            | SERIAL    |
| activated_time | TIMESTAMP |
| expired_time   | TIMESTAMP |
| coins          | INT       |

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

### Setup procedure
1. clone the PiCoinBE project
2. Setup by docker-compose

```
#Build up container
docker-compose up --build

#Stop and remove container & volume
#docker-compose down -v
```
