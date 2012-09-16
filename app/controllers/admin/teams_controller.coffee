{ mongoose } = require '../../../config/database'
Team         = mongoose.model('Team')
Event        = mongoose.model('Event')

module.exports =
  new: (req, res) ->
    Event.findById req.params.event_id, (error, event) ->
      res.render 'admin/teams/new',
        team: new Team( event_id: req.params.event_id ),
        event: event
