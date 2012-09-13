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
    newEvent = new Event @request.body.event
    newEvent.save (error, event) =>
      throw error if error
      @request.session.messages =
        notice: "#{event.name} created"
      @response.redirect "admin/events/#{event._id}"

  show: ->
    Event.findOne @request.params.id, (error, event) =>
      @response.render 'admin/events/show',
        event: event
        messages: @request.session.messages

module.exports = EventsController
