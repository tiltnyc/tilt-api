should = require 'should'

steps = module.exports = ->

  @World = require('../support/world').World

  @Then /^I (?:am on|go to) (.+)$/, (path, next) ->
    @browser.visit(@selectorFor(path), next)

  @Then /^I fill in "(.+)" with "(.+)"$/, (name, value, next) ->
    @browser.fill(name, value, next)

  @Then /^I press "(.+)"$/, (name, next) ->
    @browser.pressButton(name, next)

  @Then /^I click "(.+)"$/, (name, next) ->
    @browser.clickLink(name, next)

  @Then /^I should see "(.+)"$/, (text, next) ->
    @browser.html().should.include(text)

  @Then /^show me the page$/, (next) ->
    @browser.wait =>
      console.log arguments
      console.log "\nBrowser Errors:", @browser.errors
      console.log @browser.html()
      @browser.viewInBrowser()

      next()
