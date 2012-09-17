{ mongoose }   = require '../../../config/database'
Event          = mongoose.model('Event')

module.exports =
  index: (req, res) ->
    Event.find({}).exec (error, events) ->
      res.render 'admin/events/index',
        events: events
        messages: req.session.messages

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

  edit: (req, res) ->
    Event.findOne req.params.id, (error, event) ->
      res.render 'admin/events/edit',
        event: event

  update: (req, res) ->
    Event.findByIdAndUpdate req.params.id, req.body.event, new: true, (error, event) ->
      req.session.messages =
        notice: "#{event.name} updated"
      res.redirect "admin/events/#{event._id}"

  destroy: (req, res) ->
    Event.findByIdAndRemove req.params.id, (error, event) ->
      req.session.messages =
        notice: "#{event.name} has been deleted"
      res.redirect "admin/events"
