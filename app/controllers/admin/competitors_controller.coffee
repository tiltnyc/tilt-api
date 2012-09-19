{ mongoose } = require '../../../config/database'
Team         = mongoose.model('Team')
Event        = mongoose.model('Event')
User         = mongoose.model('User')
Competitor   = mongoose.model('Competitor')

module.exports =
  index: (req, res) ->
    Event.findById req.params.event_id, (error, event) ->
      Team.findById req.params.team_id , (error, team) ->
        Competitor.find({ team_id: req.params.team_id }).populate('user').exec (error, competitors) ->
          res.render 'admin/competitors/index',
            event:        event
            team:         team
            competitors:  competitors

  new: (req, res) ->
    Event.findById req.params.event_id, (error, event) ->
      Team.findById req.params.team_id , (error, team) ->
        User.find({}).exec (error, users) ->
          res.render 'admin/competitors/new',
            event:       event
            team:        team
            users:       users
            competitor:  new Competitor({ team_id: req.params.team_id })

  create: (req, res) ->
    newCompetitor = new Competitor(req.body.competitor)
    newCompetitor.save (error, competitor) ->
      Team.findById competitor.team_id, (error, team) ->
        User.findById competitor.user_id, (error, user) ->
          req.session.messages =
            notice: "#{user.name} added to #{team.name}"
          res.redirect "admin/events/#{team.event_id}/teams/#{team._id}/competitors"

