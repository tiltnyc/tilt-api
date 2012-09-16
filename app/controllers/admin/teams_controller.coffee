{ mongoose } = require '../../../config/database'
Team         = mongoose.model('Team')
Event        = mongoose.model('Event')

module.exports =
  new: (req, res) ->
    Event.findById req.params.event_id, (error, event) ->
      res.render 'admin/teams/new',
        team: new Team( event_id: req.params.event_id ),
        event: event

  create: (req, res) ->
    newTeam = new Team(req.body.team)
    newTeam.event_id = req.params.event_id
    newTeam.save (error, team) ->
      req.session.messages =
        notice: "#{team.name} created"
      res.redirect "admin/events/#{team.event_id}/teams/#{team._id}"

  show: (req, res) ->
    Team.findOne req.params.id, (error, team) ->
      res.render 'admin/teams/show',
        team: team
        messages: req.session.messages

  edit: (req, res) ->
    Team.findOne req.params.id, (error, team) ->
      res.render 'admin/teams/edit',
        team: team

  update: (req, res) ->
    Team.findByIdAndUpdate req.params.id, req.body.team, new :true, (error, team) ->
      req.session.messages =
        notice: "#{team.name} updated"
      res.redirect "admin/events/#{team.event_id}/teams/#{team._id}"
