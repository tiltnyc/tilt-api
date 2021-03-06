HomesController = require './../app/controllers/homes_controller'
Admin           = require './../app/controllers/admin'

module.exports = (app) ->

  app.get  '/', HomesController.show

  app.get   '/admin/login',            Admin.SessionsController.new
  app.get   '/admin/logout',           Admin.SessionsController.destroy
  app.post  '/admin/sessions/create',  Admin.SessionsController.create

  app.get  '/admin/dashboard',  Admin.DashboardController.show

  app.get     '/admin/events',              Admin.EventsController.index
  app.get     '/admin/events/new',          Admin.EventsController.new
  app.post    '/admin/events/create',       Admin.EventsController.create
  app.get     '/admin/events/:id',          Admin.EventsController.show
  app.get     '/admin/events/:id/edit',     Admin.EventsController.edit
  app.put     '/admin/events/:id/update',   Admin.EventsController.update
  app.delete  '/admin/events/:id/destroy',  Admin.EventsController.destroy

  app.get   '/admin/events/:event_id/teams',             Admin.TeamsController.index
  app.get   '/admin/events/:event_id/teams/new',         Admin.TeamsController.new
  app.post  '/admin/events/:event_id/teams/create',      Admin.TeamsController.create
  app.get   '/admin/events/:event_id/teams/:id',         Admin.TeamsController.show
  app.get   '/admin/events/:event_id/teams/:id/edit',    Admin.TeamsController.edit
  app.put   '/admin/events/:event_id/teams/:id/update',  Admin.TeamsController.update

  app.get   '/admin/events/:event_id/teams/:team_id/competitors',         Admin.CompetitorsController.index
  app.get   '/admin/events/:event_id/teams/:team_id/competitors/new',     Admin.CompetitorsController.new
  app.post  '/admin/events/:event_id/teams/:team_id/competitors/create',  Admin.CompetitorsController.create
