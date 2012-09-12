HomesController = require './../app/controllers/homes_controller'
Admin           = require './../app/controllers/admin/admin'

module.exports = (app) ->

  app.get '/', (request, response) ->
    new HomesController(request, response).show()

  app.get '/admin/login', (request, response) ->
    new Admin.SessionsController(request, response).new()

  app.get '/admin/logout', (request, response) ->
    new Admin.SessionsController(request, response).destroy()

  app.get '/admin/dashboard', (request, response) ->
    new Admin.DashboardController(request, response).show()

  app.post '/admin/sessions/create', (request, response) ->
    new Admin.SessionsController(request, response).create()

  app.get '/admin/events', (request, response) ->
    new Admin.EventsController(request, response).index()
