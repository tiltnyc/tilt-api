express = require 'express'
http    = require 'http'
path    = require 'path'

app = express()

app.root = __dirname

require('./config/bootstrap'  )(app)
require('./config/application')(app)
require('./config/routes'     )(app)

module.exports = app

http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get('port')
