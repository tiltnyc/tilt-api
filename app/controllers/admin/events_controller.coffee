{ mongoose }   = require '../../../config/database'
Event          = mongoose.model('Event')

module.exports =
  index: (req, res) ->
    Event.find({}).exec (error, events) ->
      res.render 'admin/events/index',
        events: events

  new: (req, res) ->
    res.render 'admin/events/new',
      event: new Event

  create: (req, res) ->
    newEvent = new Event req.body.event
    newEvent.save (error, event) ->
      throw error if error
      req.session.messages =
        notice: "#{event.name} created"
      res.redirect "admin/events/#{event._id}"

  show: (req, res) ->
    Event.findOne req.params.id, (error, event) ->
      res.render 'admin/events/show',
        event: event
        messages: req.session.messages
