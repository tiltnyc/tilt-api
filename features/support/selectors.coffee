module.exports =
  # Elements

  '^(.*) within (.*)$': (inner, outer) ->
    return "#{@selectorFor(outer)} #{@selectorFor(inner)}"

  '^(.*) containing "([^"]*)"$': (namedElement, text) ->
    return "#{@selectorFor(namedElement)}:contains('#{text}')"

  # Paths
  'the admin login page':  '/admin/login/'
  'the event name':        '#event_name'
  'the event theme':       '#event_theme'
  'the event start date':  '#event_start_date'
  'the home ?page':        '/'
  'the admin dashboard':   '/admin/dashboard'

  # fall through
  '^(.+)$': (selector) ->
    console.log "\n\nNo selector was found for '#{selector}'"
    console.log "Please do not commit code that uses this into master\n"
    return selector
