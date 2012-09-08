{Factory}   = require 'forgery'
selectors   = require './selectors'
_           = require 'underscore'
zombie      = require 'zombie'
zombie.site = 'http://localhost:3000/'

require '../../spec/factories'

class World
  constructor: (callback) ->
    # this.browser will be available in step definitions
    @browser = new zombie.Browser()

    @_ = _

    @selectors = selectors

    # tell Cucumber we're finished and to use 'this' as the world instance
    callback(@)

  selectorFor: (selector) ->
    for regexp, path of @selectors
      match = selector.match(new RegExp(regexp))

      if match
        if typeof path == 'string'
          return path
        else
          return path.apply @, match.slice(1)

    throw new Error("Could not find path for '#{selector}'")

  Factory: (factoryName, options) ->
    for key, value of options
      options[key] = switch value
        when 'true'  then true
        when 'false' then false
        when 'null'  then null
        else value

    Factory factoryName, options

module.exports.World = World
