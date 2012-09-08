steps = module.exports = ->

  @World = require('../support/world').World

  @Then /^I (?:am on|go to) (.+)$/, (path, next) ->
    @browser.visit(@selectorFor(path), next)

  @Then /^I fill in "(.+)" with "(.+)"$/, (name, value, next) ->
    @browser.fill(name, value, next)
