BaseController = require './../base_controller'
{ mongoose }   = require '../../../config/database'
Event          = mongoose.model('Event')

class EventsController extends BaseController
  index: ->
    if @request.session.administrator_id
      Event.find({}).exec (error, events) =>
        @response.render 'admin/events/index'
    else
      @response.redirect '/'

module.exports = EventsController
