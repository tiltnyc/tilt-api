process.env.NODE_ENV = 'test'

app = require '../../tilt'

{Factory}       = require 'forgery'
selectors       = require './selectors'
_               = require 'underscore'
{ mongoose }    = require '../../config/database'
DatabaseCleaner = require 'database-cleaner'
zombie          = require 'zombie'
zombie.site     = "http://localhost:#{ app.get('port') }/"

databaseCleaner = new DatabaseCleaner('mongodb')

require '../../spec/factories'

class World
  constructor: (callback) ->
    # this.browser will be available in step definitions
    @browser   = new zombie.Browser()
    @_         = _
    @selectors = selectors

    # tell Cucumber we're finished and to use 'this' as the world instance
    callback(@)

  clean: (next) ->
    databaseCleaner.clean(mongoose.connection.db, next)

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
