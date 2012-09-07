_           = require 'underscore'
zombie      = require 'zombie'
zombie.site = 'http://localhost:3000/'

class World
  constructor: (callback) ->
    # this.browser will be available in step definitions
    @browser = new zombie.Browser()

    @_ = _

    # tell Cucumber we're finished and to use 'this' as the world instance
    callback(@)

module.exports.World = World
