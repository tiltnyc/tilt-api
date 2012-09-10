BaseController = require './../base_controller'
{ mongoose }   = require '../../../config/database'
Administrator  = mongoose.model('Administrator')

Admin = {}

class Admin.SessionsController extends BaseController
  show: ->
    @response.render 'admin/sessions/show'

  create: ->
    administrator = Administrator(@request.body.admin)
    administrator.save (error) ->
      if error
        throw error
      else
        @response.redirect '/'

module.exports = Admin
