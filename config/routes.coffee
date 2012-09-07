home = require './../app/routes/index'
user = require './../app/routes/user'

HomesController = require './../app/controllers/homes_controller'

module.exports = (app) ->

  app.get '/', (request, response) ->
    new HomesController(request, response).show()

  app.get '/users', user.list
