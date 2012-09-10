BaseController = require './base_controller'

class HomesController extends BaseController
  show: ->
    @response.render 'homes/show'

module.exports = HomesController
