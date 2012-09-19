{ mongoose } = require '../../../config/database'
Team         = mongoose.model('Team')
Event        = mongoose.model('Event')
User         = mongoose.model('User')
Competitor   = mongoose.model('Competitor')

module.exports =
  index: (req, res) ->
    Event.findById req.params.event_id, (error, event) ->
      Team.findById req.params.team_id , (error, team) ->
        Competitor.find({ team: req.params.team_id }).populate('user').exec (error, competitors) ->
          res.render 'admin/competitors/index',
            event:        event
            team:         team
            competitors:  competitors
            messages:     req.session.messages

  new: (req, res) ->
    Event.findById req.params.event_id, (error, event) ->
      Team.findById req.params.team_id , (error, team) ->
        User.find({}).exec (error, users) ->
          res.render 'admin/competitors/new',
            event:       event
            team:        team
            users:       users
            competitor:  new Competitor({ team: req.params.team_id })

  create: (req, res) ->
    newCompetitor = new Competitor(req.body.competitor)
    newCompetitor.save (error, competitor) ->
      Competitor.findById(competitor._id).populate('user').populate('team').exec (error, competitor) ->
        req.session.messages =
          notice: "#{competitor.user.name} added to #{competitor.team.name}"
        res.redirect "admin/events/#{competitor.team.event}/teams/#{competitor.team._id}/competitors"
