const model = require('../model/model')
const mining = model({
  name: 'mining',
  tableName: 'mining'
})
const friends = model({
  name: 'friends',
  tableName: 'friends'
})

const DAYMILLISEC = 24 * 60 * 60 * 1000

const calcBonusPeriod = ({ activated_time, expired_time, existed_expired_time, friend_activated_time }) => {
  const now = new Date().valueOf() > expired_time ? expired_time : new Date().valueOf();
  const normal_period = now - activated_time
  let bonus_period = 0
  if (existed_expired_time && friend_activated_time) {
    if (existed_expired_time < friend_activated_time) {
      bonus_period = (now - friend_activated_time) + (existed_expired_time - activated_time)
    } else {
      bonus_period = now - activated_time
    }
  } else if (existed_expired_time) {
    bonus_period = existed_expired_time - activated_time
  } else if (friend_activated_time) {
    bonus_period = now - friend_activated_time
  }
  return Math.floor(normal_period / 1000) + (Math.floor(bonus_period / 1000) * 0.25)
}

const handleAcitvateMining = async (req, res, db) => {
  const { id } = req.params
  const now = new Date().valueOf();
  const [{ expired_time, coins }] = await mining.find(['id', '=', id])
  if (expired_time) {
    return res.status(401).json('INVALID_ACTIVATE_ACTION')
  }
  const current_coins = coins;
  const friendList = (await friends.find(['user_a', '=', id], 'user_b')).map(({ user_b }) => user_b)
  const expired_time_list = (await mining.find(['id', 'IN', friendList])).filter(({ activated_time, expired_time }) => {
    return activated_time && expired_time
  }).map(({ expired_time }) => expired_time)

  const update_content = {
    activated_time: Date.now(),
    expired_time: new Date(now + (24 * 60 * 60 * 1000)).valueOf(),
    points: current_coins,
  }
  const update_content_timestamp = {
    activated_time: new Date(),
    expired_time: new Date(now + (24 * 60 * 60 * 1000)),
    coins: current_coins,
    existed_expired_time: null,
    friend_activated_time: expired_time_list.length ? Math.max(...expired_time_list) : null
  }

  await mining.update(id, update_content_timestamp)
  setInterval(async () => {
    const [activated_time, expired_time, existed_expired_time, friend_activated_time] = await mining.find(['id', '=', id])
    await mining.update(id, {
      activated_time: null,
      expired_time: null,
      coins: current_coins + calcBonusPeriod({
        activated_time, expired_time, existed_expired_time,
        friend_activated_time
      }),
      friend_activated_time: null,
      existed_expired_time: null
    })
  }, DAYMILLISEC)

  // Set Friends bonus activated_time
  for (const friend_id of friendList) {
    const friend_mining = await mining.find(['id', '=', friend_id])
    if (!friend_mining.expired_time) {
      continue
    }
    await mining.update(id, {
      friend_activated_time: new Date(),
    })
  }

  return res.status(200).json(update_content)

};

const handleGetMiningStatus = async (req, res, db) => {
  const { id } = req.params
  const [miningInfo] = await mining.find(['id', '=', id])
  // Normal
  const activated_time = new Date(miningInfo.activated_time).valueOf()
  const expired_time = new Date(miningInfo.expired_time).valueOf()
  // Bonus
  const existed_expired_time = miningInfo.existed_expired_time ? new Date(miningInfo.existed_expired_time).valueOf() : null
  const friend_activated_time = miningInfo.friend_activated_time ? new Date(miningInfo.friend_activated_time).valueOf() : null
  const current_point = miningInfo.coins
  // Ready for activation
  if (!expired_time) {
    return res.status(200).json({
      activated_time: null,
      expired_time: null,
      points: current_point
    })
  }
  // Mining
  const points = current_point + calcBonusPeriod({
    activated_time, expired_time, existed_expired_time,
    friend_activated_time
  })

  return res.status(200).json({
    activated_time,
    expired_time,
    points
  });
}



module.exports = {
  handleAcitvateMining: handleAcitvateMining,
  handleGetMiningStatus: handleGetMiningStatus
};
