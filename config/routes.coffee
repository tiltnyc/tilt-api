HomesController         = require './../app/controllers/homes_controller'
AdminSessionsController = require './../app/controllers/admin/sessions_controller'

module.exports = (app) ->

  app.get '/', (request, response) ->
    new HomesController(request, response).show()

  app.get '/admin/login', (request, response) ->
    new AdminSessionsController(request, response).show()
