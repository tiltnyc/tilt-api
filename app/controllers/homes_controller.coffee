BaseController = require './base_controller'
{ mongoose }   = require '../../config/database'
Administrator  = mongoose.model('Administrator')


class HomesController extends BaseController
  show: ->
    _id = @request.session.administrator_id
    Administrator.findOne { _id: _id }, (error, administrator) =>
      throw error if error
      @response.render 'homes/show',
        administrator: administrator

module.exports = HomesController
