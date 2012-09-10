{ mongoose }  = require '../../config/database'

Administrator = mongoose.model('Administrator')

steps = module.exports = ->

  @World = require('../support/world').World

  @Then /^an admin exists with the following information:$/, (table, next) ->
    @_(table.hashes()).each (row) =>
      administrator = new Administrator row
      administrator.save (error) ->
        throw error if error
        next()
