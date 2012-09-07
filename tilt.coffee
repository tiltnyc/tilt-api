express = require 'express'
http    = require 'http'

routes  = require './config/routes'
config  = require './config/application'

app = express()

config(app)

routes(app)

http.createServer(app).listen app.get('port'), ->
  console.log("Express server listening on port " + app.get('port'))
