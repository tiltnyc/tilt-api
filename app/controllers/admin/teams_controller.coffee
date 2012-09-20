{ mongoose } = require '../../../config/database'
Team         = mongoose.model('Team')
Event        = mongoose.model('Event')
User         = mongoose.model('User')

module.exports =
  index: (req, res) ->
    Event.findById req.params.event_id, (error, event) ->
      Team.find { event: req.params.event_id } , (error, teams) ->
        res.render 'admin/teams/index',
          teams: teams
          event: event

  new: (req, res) ->
    Event.findById req.params.event_id, (error, event) ->
      res.render 'admin/teams/new',
        team: new Team( event: req.params.event_id ),
        event: event

  create: (req, res) ->
    newTeam = new Team(req.body.team)
    newTeam.event = req.params.event_id
    newTeam.save (error, team) ->
      req.session.messages =
        notice: "#{team.name} created"
      res.redirect "admin/events/#{team.event}/teams/#{team._id}"

  show: (req, res) ->
    Team.findOne req.params.id, (error, team) ->
      res.render 'admin/teams/show',
        team: team
        messages: req.session.messages

  edit: (req, res) ->
    Team.findOne req.params.id, (error, team) ->
      User.find({}).exec (error, users) ->
        res.render 'admin/teams/edit',
          team: team
          users: users

  update: (req, res) ->
    Team.findByIdAndUpdate req.params.id, req.body.team, new :true, (error, team) ->
      req.session.messages =
        notice: "#{team.name} updated"
      res.redirect "admin/events/#{team.event}/teams/#{team._id}"
