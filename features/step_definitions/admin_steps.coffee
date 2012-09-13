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

  @Given /^I am logged in as an admin$/, (next) ->
    administrator = new Administrator({username: 'user', password: 'pass', name: 'me'})
    administrator.save =>
      @browser.visit '/admin/login', (error, browser) ->
        browser.
          fill('admin[username]', administrator.username).
          fill('admin[password]', administrator.password).
          pressButton('Login', next)
