class BaseController
  constructor: (@request, @response) ->

  request: ->
    @request

  response: ->
    @response

  isAdmin: ->
    @request.session.administrator_id?

module.exports = BaseController
