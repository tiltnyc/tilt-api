require './database'
fs       = require 'fs'

module.exports = (app) ->
  # Bootstrap models
  for file in fs.readdirSync(app.root + '/app/models')
    require app.root + '/app/models/' + file
