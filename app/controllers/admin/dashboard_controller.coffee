BaseController = require './../base_controller'

class DashboardController extends BaseController
  show: ->
    if @request.session.administrator_id
      @response.render 'admin/dashboard/show'
    else
      @response.redirect '/'

module.exports = DashboardController
