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

const calcBonusPeriod = ({ bonus, activated_time, expired_time }) => {
  let bonus_start = 0
  let bonus_end = 0

  if (!bonus.length) {
    return { bonus_start, bonus_end }
  }
  bonus_start = Math.min(...(bonus.map(({ activated_time }) => new Date(activated_time).valueOf())))
  bonus_end = Math.max(...(bonus.map(({ expired_time }) => new Date(expired_time).valueOf())))
  if (bonus_start < activated_time) {
    bonus_start = activated_time
  }
  if (bonus_end > expired_time) {
    bonus_end = expired_time > now ? now : expired_time
  }
  return { bonus_start, bonus_end }
}

const handleAcitvateMining = async (req, res, db) => {
  const { id } = req.params
  const now = new Date().valueOf();
  const [miningInfo] = await mining.find(['id', '=', id])
  if (miningInfo.expired_time) {
    return res.status(401).json('INVALID_ACTIVATE_ACTION')
  }
  const current_coins = miningInfo.coins;
  const update_content = {
    activated_time: Date.now(),
    expired_time: new Date(now + (24 * 60 * 60 * 1000)).valueOf(),
    points: current_coins
  }
  const update_content_timestamp = {
    activated_time: new Date(),
    expired_time: new Date(now + (24 * 60 * 60 * 1000)),
    coins: current_coins
  }

  await mining.update(id, update_content_timestamp)
  setInterval(async () => {
    await mining.update(id, {
      activated_time: null,
      expired_time: null,
      coins: calcCoins.bind(this)
    })
  }, DAYMILLISEC)

  return res.status(200).json(update_content)

};

const handleGetMiningStatus = async (req, res, db) => {
  const { id } = req.params
  const now = new Date().valueOf();
  const [miningInfo] = await mining.find(['id', '=', id])
  const activated_time = new Date(miningInfo.activated_time).valueOf()
  const expired_time = new Date(miningInfo.expired_time).valueOf()
  const current_point = miningInfo.coins
  if (!expired_time) {
    return res.status(200).json({
      activated_time: null,
      expired_time: null,
      points: current_point
    })
  }
  const friendList = (await friends.find(['user_a', '=', id], 'user_b')).map(({ user_b }) => user_b)
  const bonus = (await mining.find(['id', 'IN', friendList])).filter(({ activated_time, expired_time }) => {
    return activated_time && expired_time
  })

  const { bonus_start, bonus_end } = calcBonusPeriod({ activated_time, expired_time, bonus })
  const points = current_point + Math.floor((now - activated_time) / 1000) + (0.25 * Math.floor((bonus_end - bonus_start) / 1000))

  return res.status(200).json({
    miningInfo,
    activated_time,
    expired_time,
    points
  });
}



module.exports = {
  handleAcitvateMining: handleAcitvateMining,
  handleGetMiningStatus: handleGetMiningStatus
};
