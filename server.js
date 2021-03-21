const express = require('express');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');
const cors = require('cors');
const knex = require('knex');
const morgan = require('morgan');

const register = require('./controllers/register');
const signin = require('./controllers/signin');
const mining = require('./controllers/mining');
const friends = require('./controllers/friends')
const auth = require('./controllers/authorization')

//Database Setup
const db = knex({
  client: 'pg',
  connection: process.env.POSTGRES_URI
});

const app = express();
const port = process.env.PORT || 3000

const whitelist = ['http://localhost:3000']
const corsOptions = {
  origin: '*',

  methods: [
    'GET',
    'POST',
  ],

  allowedHeaders: [
    'Content-Type',
    'Authorization',
    'X-CSRFToken'
  ],
}

app.use(morgan('combined'));
app.use(cors(corsOptions))

app.use(bodyParser.json());
// Authenication
app.post('/signin', signin.signinAuthentication(db, bcrypt))
app.post('/register', (req, res) => { register.handleRegister(req, res, db, bcrypt) })
// Friend
app.get('/:id/friends', auth.requireAuth, async (req, res) => { friends.handleListFriends(req, res, db) })
// Mining
app.post('/:id/mining', auth.requireAuth, async (req, res) => { mining.handleAcitvateMining(req, res, db) })
app.get('/:id/mining', auth.requireAuth, async (req, res) => { mining.handleGetMiningStatus(req, res, db) })
app.listen(port, () => {
  console.log('app is running on port 3000');
})
