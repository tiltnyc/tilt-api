should       = require 'should'
{ mongoose } = require '../../config/database'

steps = module.exports = ->

  @World = require('../support/world').World

  @After (next) ->
    @clean next

  @Then /^I (?:am on|go to) (.+)$/, (path, next) ->
    @browser.visit(@selectorFor(path), next)

  @Then /^I fill in "(.+)" with "(.+)"$/, (name, value, next) ->
    @browser.fill(name, value, next)

  @Then /^I press "(.+)"$/, (name, next) ->
    @browser.pressButton(name, next)

  @Then /^I click "(.+)"$/, (name, next) ->
    @browser.clickLink(name, next)

  @Then /^I should (not )?see "(.+)"$/, (negation, text, next) ->
    if negation
      @browser.html().should.not.include(text)
    else
      @browser.html().should.include(text)
    next()

  @Then /^show me the page$/, (next) ->
    @browser.wait =>
      if @browser.errors.length
        console.log "\nBrowser Errors:", @browser.errors
      console.log @browser.html()
      #@browser.viewInBrowser()

      next()

  @Then /^an? (.*) exists with the following:$/, (modelName, table, next) ->
    model = mongoose.model(modelName.camelize())
    model.create table.hashes(), next
