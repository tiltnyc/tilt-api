fs = require 'fs'

module.exports = (app) ->
  # Bootstrap models

  for file in fs.readdirSync(app.root + '/app/models/')
    if file.match(new RegExp(/.*\.coffee$/))
      require app.root + '/app/models/' + file
