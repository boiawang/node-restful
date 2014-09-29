url = require('./controllers/')
app = require('./lib/config').app
projectConfig = require './config'

mongoose = require projectConfig.name
mongoose.connect projectConfig.db

app.use '/', url.router

# 路由到 '/'
app.get '/add_url', url.index

app.post '/add_url', url.new

app.listen app.get 'port'

console.log '监听端口:' + app.get 'port'
