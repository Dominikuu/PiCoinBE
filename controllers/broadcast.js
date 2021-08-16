
const model = require('../model/model')
const actions = require('./action');
const mining = model({
    name: 'mining',
    tableName: 'mining'
})
const friends = model({
    name: 'friends',
    tableName: 'friends'
})

const colllectFriendList = async (user_id) => (await friends.find(['user_a', '=', user_id], 'user_b')).map(({ user_b }) => user_b)
const handleFreindMiningActivate = async (socket, user_id, db) => {
    const friendList = await colllectFriendList(user_id)
    for (const friend_id of friendList) {
        const [friend_mining] = await mining.find(['id', '=', friend_id])
        if (!friend_mining.expired_time) {
            continue
        }
        socket.to(`room_${friend_id}`).emit(actions.FRIEND_ACTIVATED, true)
    }
}

const initBuildSocketRoom = async (socket, user_id, db, io) => {
    const [miningInfo] = await mining.find(['id', '=', user_id])
    const { activated_time, expired_time } = miningInfo
    // Check Self Mining status
    if (!activated_time || !expired_time) {
        return
    }
    // Create room
    socket.join(`room_${user_id}`)
    
    // Added to Friends room
    const friendList = await colllectFriendList(user_id)
    for (const friend_id of friendList) {
        const [friend_mining] = await mining.find(['id', '=', friend_id])
        if (!friend_mining.expired_time) {
            continue
        }
        socket.join(`room_${friend_id}`)
    }
}

module.exports = {
    initBuildSocketRoom,
    handleFreindMiningActivate,
}