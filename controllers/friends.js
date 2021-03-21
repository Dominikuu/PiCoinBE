const model = require('../model/model')
const friends = model({
    name: 'friends',
    tableName: 'friends'
})

const handleListFriends = async (req, res, db) => {
    const { id } = req.params
    const friendList = (await friends.find(['user_a', '=', id], 'user_b')).map(({ user_b }) => user_b)
    res.status(200).json(friendList)
};

module.exports = {
    handleListFriends: handleListFriends
};