HomesController = require './../app/controllers/homes_controller'
Admin           = require './../app/controllers/admin/sessions_controller'

module.exports = (app) ->

  app.get '/', (request, response) ->
    new HomesController(request, response).show()

  app.get '/admin/login', (request, response) ->
    new Admin.SessionsController(request, response).new()

  app.post '/admin/sessions/create', (request, response) ->
    new Admin.SessionsController(request, response).create()
