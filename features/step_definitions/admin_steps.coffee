steps = module.exports = ->

  @World = require('../support/world').World

  @Then /^an admin exists with the following information:$/, (table, next) ->
    @_(table.hashes()).each (row) =>
      @Factory('Admin', row)
      next()
