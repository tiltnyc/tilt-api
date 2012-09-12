BaseController = require './../base_controller'
{ mongoose }   = require '../../../config/database'
Administrator  = mongoose.model('Administrator')

Admin = {}

class Admin.SessionsController extends BaseController
  new: ->
    @response.render 'admin/sessions/new'

  create: ->
    params =
      username: @request.body.admin.username
      password: @request.body.admin.password

    Administrator.findOne params, (error, administrator) =>
      throw error if error
      @request.session.administrator_id = administrator._id
      @response.redirect '/'

  destroy: ->
    @request.session.administrator_id = null
    @response.redirect '/'

module.exports = Admin
