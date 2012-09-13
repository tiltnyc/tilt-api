BaseController = require './../base_controller'

class DashboardController extends BaseController
  show: ->
    if @isAdmin()
      @response.render 'admin/dashboard/show'
    else
      @response.redirect '/'

module.exports = DashboardController
