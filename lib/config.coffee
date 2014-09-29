path = require 'path'
express = require 'express'
app = express()

bodyParser = require 'body-parser'

# only utf-8
app.use bodyParser.urlencoded
  # use qs(https://www.npmjs.org/package/qs#readme)
  extended: true

app.use bodyParser.json()

# config data
app.set 'port', process.env.PORT || 3000
app.set 'view engine', 'jade'
app.set 'views', path.join(__dirname, '../views')

app.all '*', (req, res, next) ->
  res.set
    'Access-Control-Allow-Origin': '*'
    'Access-Control-Allow-Headers': 'X-Requested-With',
    'Access-Control-Allow-Methods': 'GET'
  next()

app.use express['static'] path.join(__dirname, '../assets'), {
  maxAge: 86400000
}

exports.router = express.Router()
exports.app = app
