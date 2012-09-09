BaseController = require './../base_controller'
Administrator  = require '../../models/administrator'

Admin = {}

class Admin.SessionsController extends BaseController
  show: ->
    @response.render 'admin/sessions/show'

  create: ->
    Administrator
    @response.render 'admin/sessions/show'

module.exports = Admin
