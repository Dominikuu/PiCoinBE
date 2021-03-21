# PiCoinBE

### GUI
Please refer to https://github.com/Dominikuu/PiCoinFE

coin計算: user mining 24hr期間 x 1 + 好友有上線的期間(minimum of friend activated_time ~ maximum of friend expired_time) x 0.25

Tecnique stack
Nodjs/Express, PostgreSQL,Redis, Nginx

### API
取得用戶朋友的狀態
- GET /{user_id}/friends

取得用戶的狀態
- GET /{user_id}/mining

開始挖礦
- POST /{user_id}/mining

coins: number
activated_time: number
expired_time: number

DB schema

friends:
user_id: string
firend: string[]

mining
user_id: string
expired_time: int
activated_time: int

### Setup procedure
1. clone the PiCoinBE project
2. Setup by docker-compose

```
#Build up container
docker-compose up --build

#Stop and remove container & volume
#docker-compose down -v
```
