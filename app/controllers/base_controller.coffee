class BaseController
  constructor: (@request, @response) ->

  request: ->
    @request

  response: ->
    @response

module.exports = BaseController
