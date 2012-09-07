home = require './../app/routes/index'
user = require './../app/routes/user'

HomesController = require './../app/controllers/homes_controller'

module.exports = (app) ->

  app.get '/', (request, response) ->
    controller = new HomesController(request, response)
    controller.show()

  app.get '/users', user.list
