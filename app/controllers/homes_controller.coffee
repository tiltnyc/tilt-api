BaseController = require './base_controller'

class HomesController extends BaseController
  show: ->
    @response.send('')

module.exports = HomesController
