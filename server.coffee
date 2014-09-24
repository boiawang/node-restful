path = require 'path'
express = require 'express'
app = express()
routers = require('./routes/index').router

# https://github.com/expressjs/body-parser
bodyParser = require 'body-parser'

mongoose = require 'mongoose'
mongoose.connect 'mongodb://127.0.0.1:27017/gez-cloud'

# only utf-8
app.use bodyParser.urlencoded
  # use qs(https://www.npmjs.org/package/qs#readme)
  extended: true

app.use bodyParser.json()

# config data
app.set 'port', process.env.PORT || 3000
app.set 'view engine', 'jade'
app.set 'views', __dirname + '/views'

app.all '*', (req, res, next) ->
  res.set
    'Access-Control-Allow-Origin': '*'
    'Access-Control-Allow-Headers': 'X-Requested-With',
    'Access-Control-Allow-Methods': 'GET'
  next()

app.use '/', routers

app.use express['static'] path.join(__dirname, 'assets'), {
  maxAge: 86400000
}

# 路由到 '/'
app.get '/add_url', (req, res) ->
  res.render 'addUrl'

app.post '/add_url', (req, res) ->
  res.send
    message: 'add url'

app.listen app.get 'port'

console.log '监听端口:' + app.get 'port'
