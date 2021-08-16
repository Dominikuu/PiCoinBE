const actions = require('./controllers/action');
const broadcast = require('./controllers/broadcast')

const app = require('express')()
const http = require('http').Server(app)
const io = require('socket.io')(http, {
    cors: {
        credentials: true,
        origin: 'http://localhost:4200',

    },
    allowEIO3: true
})

io.on('connect', (client) => {
    client.on(actions.INIT, (user_id) => broadcast.initBuildSocketRoom(client, user_id));
    client.on(actions.FRIEND_ACTIVATED, (user_id) => broadcast.handleFreindMiningActivate(client, user_id))
})

http.listen(8088, () => {
    console.log('listening on *: 8088')
})