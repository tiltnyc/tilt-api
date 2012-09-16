HomesController = require './../app/controllers/homes_controller'
Admin           = require './../app/controllers/admin'

module.exports = (app) ->

  app.get  '/', HomesController.show

  app.get  '/admin/login',            Admin.SessionsController.new
  app.get  '/admin/logout',           Admin.SessionsController.destroy
  app.post '/admin/sessions/create',  Admin.SessionsController.create

  app.get '/admin/dashboard',  Admin.DashboardController.show

  app.get  '/admin/events',             Admin.EventsController.index
  app.get  '/admin/events/new',         Admin.EventsController.new
  app.post '/admin/events/create',      Admin.EventsController.create
  app.get  '/admin/events/:id',         Admin.EventsController.show
  app.get  '/admin/events/:id/edit',    Admin.EventsController.edit
  app.post '/admin/events/:id/update',  Admin.EventsController.update

  app.get  '/admin/events/:event_id/teams/new',         Admin.TeamsController.new
  app.post '/admin/events/:event_id/teams/create',      Admin.TeamsController.create
  app.get  '/admin/events/:event_id/teams/:id',         Admin.TeamsController.show
  app.get  '/admin/events/:event_id/teams/:id/edit',    Admin.TeamsController.edit
  app.post '/admin/events/:event_id/teams/:id/update',  Admin.TeamsController.update
