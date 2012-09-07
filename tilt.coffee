express = require 'express'
routes  = require './app/routes/index'
user    = require './app/routes/user'
http    = require 'http'
path    = require 'path'

app = express()

app.configure ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser('2ee27441d3ee4a527de019325dc7e8ddee6039cc7cad9801181c6fd68204129bdf3225cafabb3f6d0324a7bd851dabbd0bd3')
  app.use express.session()
  app.use app.router
  app.use express.static(path.join(__dirname, 'public'))

app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', routes.index
app.get '/users', user.list

http.createServer(app).listen app.get('port'), ->
  console.log("Express server listening on port " + app.get('port'))
