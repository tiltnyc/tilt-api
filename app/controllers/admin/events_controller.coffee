BaseController = require './../base_controller'
{ mongoose }   = require '../../../config/database'
Event          = mongoose.model('Event')

class EventsController extends BaseController
  index: ->
    Event.find({}).exec (error, events) =>
      @response.render 'admin/events/index',
        events: events

  new: ->
    @response.render 'admin/events/new',
      event: new Event

  create: ->
    event = new Event @request.body.event
    event.save =>
      @response.locals.messages = ["#{event.name} created"]
      @response.render 'admin/events/show',
        event: event

module.exports = EventsController
