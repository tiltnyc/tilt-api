should       = require 'should'
{ mongoose } = require '../../config/database'

steps = module.exports = ->

  @World = require('../support/world').World

  @After (next) ->
    @clean next

  @Then /^I (?:am on|go to) (.+)$/, (path, next) ->
    @browser.visit(@selectorFor(path), next)

  @Then /^I fill in (.+) with "(.+)"$/, (selector, value, next) ->
    element = @selectorFor(selector)
    @browser.fill(element, value, next)

  @Then /^I press "(.+)"$/, (name, next) ->
    @browser.pressButton(name, next)

  @Then /^I click "(.+)"$/, (name, next) ->
    @browser.clickLink(name, next)

  @Then /^I should (not )?see "([^"]+)"$/, (negation, text, next) ->
    if negation
      @browser.html().should.not.include(text)
    else
      @browser.html().should.include(text)
    next()

  @Then /^the value of ([^"]+) should be "([^"]+)"$/, (selector, value, next) ->
    selector = @selectorFor(selector)
    console.log selector
    console.log Object.keys @$(selector)
    ''.should.eql value, "#{selector} should have had a value of #{value}"
    next()

  @Then /^an? (.*) exists with the following:$/, (modelName, table, next) ->
    model = mongoose.model(modelName.camelize())
    model.create table.hashes(), next

  @Then /^show me the page$/, (next) ->
    @browser.wait =>
      if @browser.errors.length
        console.log "\nBrowser Errors:", @browser.errors
      console.log @browser.html()
      #@browser.viewInBrowser()

      next()

  @Then /^show me the contents of (.*)$/, (namedElement, next) ->
    @browser.wait =>
      selector   = @selectorFor(namedElement)
      htmlString = @browser.html(selector)

      if @browser.errors.length
        console.log "Errors: #{@browser.errors}"
      console.log "\nHTML Contents of '#{selector}':\n"
      console.log htmlString

      next()

