sugar        = require 'sugar'
express      = require 'express'
everyauth    = require 'everyauth'
path         = require 'path'
config       = require 'yaml-config'
{ mongoose } = require './database'

settings = config.readConfig('config/config.yaml', process.env.NODE_ENV)

module.exports = (app) ->

  app.configure ->

    app.set 'port', process.env.PORT || settings.app.port || 3000
    app.set 'views', "#{app.root}/app/views"
    app.set 'view engine', 'jade'
    app.use express.cookieParser('2ee27441d3ee4a527de019325dc7e8ddee6039cc7cad9801181c6fd68204129bdf3225cafabb3f6d0324a7bd851dabbd0bd3')
    app.use express.session({secret:'asdfauykghljkghksdhjfgkjsh'})
    app.use everyauth.middleware(app)
    app.use express.favicon()
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.static("#{ app.root }/public")
    app.use app.router

  app.configure 'development', ->
    app.use express.logger('dev')
    app.use express.errorHandler()
